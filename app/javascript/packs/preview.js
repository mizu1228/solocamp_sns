// 各投稿でのプレビューに使いまわしている

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImagePrv = document.getElementById('img-prv');

    const createImageHTML = (blob) => {

      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImagePrv.appendChild(imageElement);
    };

    document.getElementById('img-select').addEventListener('change', function(e){

      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}