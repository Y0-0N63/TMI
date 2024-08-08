document.getElementById('clip').addEventListener('click', function () {
    document.getElementById('fileInput').click();
});

document
    .getElementById('fileInput')
    .addEventListener('change', function (event) {
        const file = event.target.files[0];
        const fileNameSpan = document.getElementById('fileName');
        if (file) {
            fileNameSpan.textContent = `첨부 파일: ${file.name}`;
        } else {
            fileNameSpan.textContent = '첨부 파일 없음';
        }
    });
