if (location.pathname.includes( 'users' )) {
  window.addEventListener('load', function() {

    const followList = document.getElementById('follow')
    const followerList = document.getElementById('follower')
    const editUBtn = document.querySelector('.edit-u-btn')
    const signOutBtn = document.querySelector('.sign-out-btn')
    const followPullDown = document.querySelector('.follow-lists-bar')
    const followerPullDown = document.querySelector('.follower-lists-bar')

    followList.addEventListener('mouseover', function() {
      this.setAttribute('style', "color: rgb(160, 160, 160);")
    });
    followList.addEventListener('mouseout', function() {
      this.removeAttribute('style', "color: rgb(160, 160, 160);")
    });
    followList.addEventListener('click', function() {
      if (followPullDown.getAttribute('style') === "display: block;") {
        followPullDown.removeAttribute('style', "display: block;")
      } else {
        followPullDown.setAttribute('style', "display: block;")
      }
    });

    followerList.addEventListener('mouseover', function() {
      this.setAttribute('style', "color: rgb(160, 160, 160);")
    });
    followerList.addEventListener('mouseout', function() {
      this.removeAttribute('style', "color: rgb(160, 160, 160);")
    });
    followerList.addEventListener('click', function() {
      if (followerPullDown.getAttribute('style') === "display: block;") {
        followerPullDown.removeAttribute('style', "display: block;")
      } else {
        followerPullDown.setAttribute('style', "display: block;")
      }
    });

    if ( editUBtn !== null ) {
      editUBtn.addEventListener('mouseover', function() {
        this.setAttribute('style', "background-color: #8ca9fff3;")
      })
      editUBtn.addEventListener('mouseout', function() {
        this.removeAttribute('style', "background-color: #8ca9fff3;")
      })
      signOutBtn.addEventListener('mouseover', function() {
        this.setAttribute('style', "background-color: #999999f3;")
      })
      signOutBtn.addEventListener('mouseout', function() {
        this.removeAttribute('style', "background-color: #999999f3;")
      })
    }

  });
}