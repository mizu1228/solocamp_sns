// 各投稿でのプレビューに使いまわしている

if (document.URL.match( /new/ ) || document.URL.match( /edit/ ) && location.pathname.includes( 'tweets' )){
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

// tweet-editのpreview

if ( location.pathname.includes( 'tweets' ) && location.pathname.includes( 'edit' )) {
  document.addEventListener('DOMContentLoaded', function () {
    const tweetPrv = document.querySelector('.img-upload')
    tweetPrv.addEventListener('change', function(e) {
      const tFile = tweetPrv.files[0];
      const tReader = new FileReader();
      tReader.readAsDataURL(tFile);
      tReader.onload = function() {
        const tImage = tReader.result;
        document.querySelector('.t-img-prv').setAttribute('src', tImage);
      }
    });
  });
};



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

// gear-editのプリセットpreview

if ( location.pathname.includes( 'gears' ) && location.pathname.includes( 'edit' )) {
  document.addEventListener('DOMContentLoaded', function () {
    const gearPrv = document.querySelector('.img-upload')
    gearPrv.addEventListener('change', function(e) {
      const gFile = gearPrv.files[0];
      const gReader = new FileReader();
      gReader.readAsDataURL(gFile);
      gReader.onload = function() {
        const gImage = gReader.result;
        document.querySelector('.g-img-prv').setAttribute('src', gImage);
      }
    });
  });
};