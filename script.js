
document.addEventListener("DOMContentLoaded", function () {
  const fileInput = document.getElementById("file-input");
  const uploadBtn = document.getElementById("upload-btn");
  const fileDropArea = document.getElementById("file-drop-area");
  const filePreview = document.getElementById("file-preview");
  const browseBtn = document.getElementById("browse-btn");
  const generateBtn = document.getElementById("generate-link-btn");
  const generatedLink = document.getElementById("generated-link");

  if (browseBtn) {
    browseBtn.addEventListener("click", () => fileInput.click());
  }

  if (fileInput) {
    fileInput.addEventListener("change", handleFiles);
  }

  if (fileDropArea) {
    fileDropArea.addEventListener("dragover", (e) => {
      e.preventDefault();
      fileDropArea.style.borderColor = "#4CAF50";
    });

    fileDropArea.addEventListener("dragleave", () => {
      fileDropArea.style.borderColor = "#ccc";
    });

    fileDropArea.addEventListener("drop", (e) => {
      e.preventDefault();
      fileDropArea.style.borderColor = "#ccc";
      fileInput.files = e.dataTransfer.files;
      handleFiles();
    });
  }

  function handleFiles() {
    filePreview.innerHTML = "";
    Array.from(fileInput.files).forEach(file => {
      const div = document.createElement("div");
      div.textContent = file.name;
      filePreview.appendChild(div);
    });
    uploadBtn.disabled = !fileInput.files.length;
  }

  if (generateBtn) {
    generateBtn.addEventListener("click", () => {
      const permission = document.getElementById("permissions").value;
      const fakeLink = `https://fileshare.example.com/share?file=123&perm=${permission}`;
      generatedLink.innerHTML = `<input type="text" value="${fakeLink}" readonly style="width:100%">`;
    });
  }
});
