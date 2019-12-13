<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <title>CSS Template</title>
<script type="text/javascript">
const dropZone = document.body;
if (dropZone) {
    const hoverClassName = "hover";

    // Handle drag* events to handle style
    // Add the css you want when the class "hover" is present
    dropZone.addEventListener("dragenter", function (e) {
        e.preventDefault();
        dropZone.classList.add(hoverClassName);
    });

    dropZone.addEventListener("dragover", function (e) {
        e.preventDefault();
        dropZone.classList.add(hoverClassName);
    });

    dropZone.addEventListener("dragleave", function (e) {
        e.preventDefault();
        dropZone.classList.remove(hoverClassName);
    });

    // This is the most important event, the event that gives access to files
    dropZone.addEventListener("drop", function (e) {
        e.preventDefault();
        dropZone.classList.remove(hoverClassName);

        const files = Array.from(e.dataTransfer.files);
        console.log(files);
        // TODO do somethings with files...
    });
}
if (files.length > 0) {
    const data = new FormData();
    for (const file of files) {
        data.append('file', file);
    }

    fetch('/upload', {
        method: 'POST',
        body: data
    })
    .then(() => console.log("file uploaded"))
    .catch(reason => console.error(reason));
}
//drag* events are omitted for brevity (get them from the previous section).

dropZone.addEventListener("drop", async function (e) {
    e.preventDefault();
    dropZone.classList.remove(hoverClassName);

    console.log(await getFilesAsync(e));
});

async function getFilesAsync(dataTransfer: DataTransfer) {
    const files: File[] = [];
    for (let i = 0; i < dataTransfer.items.length; i++) {
        const item = dataTransfer.items[i];
        if (item.kind === "file") {
            if (typeof item.webkitGetAsEntry === "function") {
                const entry = item.webkitGetAsEntry();
                const entryContent = await readEntryContentAsync(entry);
                files.push(...entryContent);
                continue;
            }

            const file = item.getAsFile();
            if (file) {
                files.push(file);
            }
        }
    }

    return files;
}

// Returns a promise with all the files of the directory hierarchy
function readEntryContentAsync(entry: FileSystemEntry) {
    return new Promise<File[]>((resolve, reject) => {
        let reading = 0;
        const contents: File[] = [];

        readEntry(entry);

        function readEntry(entry: FileSystemEntry) {
            if (isFile(entry)) {
                reading++;
                entry.file(file => {
                    reading--;
                    contents.push(file);

                    if (reading === 0) {
                        resolve(contents);
                    }
                });
            } else if (isDirectory(entry)) {
                readReaderContent(entry.createReader());
            }
        }

        function readReaderContent(reader: FileSystemDirectoryReader) {
            reading++;

            reader.readEntries(function (entries) {
                reading--;
                for (const entry of entries) {
                    readEntry(entry);
                }

                if (reading === 0) {
                    resolve(contents);
                }
            });
        }
    });
}

// for TypeScript typing (type guard function)
// https://www.typescriptlang.org/docs/handbook/advanced-types.html#user-defined-type-guards
function isDirectory(entry: FileSystemEntry): entry is FileSystemDirectoryEntry {
    return entry.isDirectory;
}

function isFile(entry: FileSystemEntry): entry is FileSystemFileEntry {
    return entry.isFile;
}
</script>
    </head>
     
    <body>
<form method="post" enctype="multipart/form-data">
  <input type="file" name="photo">
  <input type="submit" value="Submit">
</form>
</body>
</html>