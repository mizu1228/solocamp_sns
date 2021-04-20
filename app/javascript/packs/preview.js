// 各投稿でのプレビューに使いまわしている

if (location.pathname.includes( 'new' ) || location.pathname.includes( 'edit') && location.pathname.includes( 'tweet' )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImagePrv = document.getElementById('img-prv');

    const createImageHTML = (blob) => {

      const imageElement = document.createElement('div');

      let blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      imageElement.appendChild(blobImage);
      ImagePrv.appendChild(imageElement);
    };

    const imgUpload = document.querySelector('.img-upload-btn');

    imgUpload.addEventListener('mouseover', function() {
      imgUpload.setAttribute('style', "background-color: #384878;");
      // imgUpload.style.display = 'none';
    });

    imgUpload.addEventListener('mouseout', function() {
      imgUpload.removeAttribute('style', "background-color: #384878;");
    });


    document.getElementById('img-select').addEventListener('change', function(e){

      const imageContent = document.querySelector('#img-prv img');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}

// user-editのpreview

if ( location.pathname.includes( 'users' ) && location.pathname.includes( 'edit' )) {
  document.addEventListener('DOMContentLoaded', function () {
    const userPrv = document.querySelector('.u-e-prv')
    userPrv.addEventListener('change', function(e) {
      const uFile = userPrv.files[0];
      const uReader = new FileReader();
      uReader.readAsDataURL(uFile);
      uReader.onload = function() {
        const uImage = uReader.result;
        document.querySelector('.u-img-prv').setAttribute('src', uImage);
      }
    });
  });
};