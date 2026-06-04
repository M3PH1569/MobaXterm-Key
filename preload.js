// Preload script for security isolation
const { contextBridge } = require('electron');

// Expose limited APIs to renderer process
contextBridge.exposeInMainWorld('electron', {
  // Add any safe APIs here if needed
  version: () => process.versions.electron
});
