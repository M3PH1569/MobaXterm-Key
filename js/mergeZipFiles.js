/**
 * Merges a custom settings file with the license file
 * @param {Blob} licenseFile - The Custom.mxtpro license file (which is a ZIP containing Pro.key)
 * @param {Blob} customSettingsFile - The MobaXterm customization.custom file (which is a ZIP with settings)
 * @returns {Promise<Blob>} - A promise that resolves to the merged ZIP file
 */
function mergeZipFiles(licenseFile, customSettingsFile) {
  return new Promise((resolve, reject) => {
    const mergedZip = new JSZip();
    const licenseZip = new JSZip();
    const settingsZip = new JSZip();
    
    licenseZip.loadAsync(licenseFile)
      .then((licenseContents) => {
        return settingsZip.loadAsync(customSettingsFile)
          .then((settingsContents) => {
            return licenseContents.file("Pro.key").async("string")
              .then((proKeyContent) => {
                mergedZip.file("Pro.key", proKeyContent);
                
                const promises = [];
                settingsContents.forEach((relativePath, file) => {
                  if (!file.dir) {
                    const promise = file.async("blob").then((content) => {
                      mergedZip.file(relativePath, content);
                    });
                    promises.push(promise);
                  }
                });
                
                return Promise.all(promises).then(() => {
                  return mergedZip.generateAsync({type: "blob"});
                });
              });
          });
      })
      .then((mergedContent) => {
        resolve(mergedContent);
      })
      .catch((error) => {
        console.error("Error merging ZIP files:", error);
        reject(error);
      });
  });
}

export { mergeZipFiles };
