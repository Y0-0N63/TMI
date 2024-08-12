document.querySelector('#clip').addEventListener('click', function () {
    document.querySelector('#fileInput').click();
});

document
    .querySelector('#fileInput')
    .addEventListener('change', function (event) {
        const file = event.target.files[0];
        const fileNameSpan = document.querySelector('#fileName');

        if (file) {
            fileNameSpan.textContent = `File Name : ${file.name}`;
        } else {
            fileNameSpan.textContent = 'No File Chosen';
        }
    });