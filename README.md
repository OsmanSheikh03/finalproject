
# File Sharing System (Frontend)

This is the frontend implementation of a simple file sharing system. It allows users to:

- Log in using an email and password.
- Upload files via drag-and-drop or file browser.
- Preview selected files before uploading.
- Generate shareable links with selectable permissions (view/edit).
- Copy generated links to the clipboard.

## Features

- Responsive and accessible design
- File type icons for visual feedback
- Copy-to-clipboard functionality
- Frontend-only prototype (can be extended with backend)

## File Structure

`Index.html` | Login page for user authentication 
`Upload.html` | File upload interface with preview and simulated progress 
`Share.html` | Link generation page with permission options 
`styles.css` | Custom styling used by all pages 
`script.js`  | JavaScript for file handling and interactivity

## Installation

To run locally, clone the repository and open `Index.html`, `Upload.html`, or `Share.html` in a modern browser:

```bash
git clone https://github.com/OsmanSheikh03/finalproject.git
cd finalproject
```

Then double-click one of the HTML files or use a local development server (e.g. Live Server extension in VS Code).

## Future Improvements

- Add backend support with authentication, file storage, and access control.
- Implement real-time upload progress and file retrieval APIs.
- Add user dashboard for managing files and shared links.
- Improve accessibility and browser compatibility.

