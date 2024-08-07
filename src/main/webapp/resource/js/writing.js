document.getElementById('clip').addEventListener('click', function () {
    document.getElementById('fileInput').click();
});

document
    .getElementById('fileInput')
    .addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            alert(`Selected file: ${file.name}`);
        }
    });
