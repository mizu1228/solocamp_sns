import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    const comments = document.querySelector('.tweet-comments'); //コメントを挿入する場所
    const name = `${data.user.name}`;  //ユーザーを入れた
    const comment = `${data.comment.comment}`; //コメントが入る
    const uImage = `${data.image}`; // imgを入れた
    
    // コメント表示のビューと同じものを作る

    const tweetId = document.createElement('div');
    tweetId.setAttribute('id', `tweet-com${data.comment.id}`);

    const tweetComment = document.createElement('ul');
    tweetComment.setAttribute('class', "tweet-comment");

      const commentBox = document.createElement('div');
      commentBox.setAttribute('class', "comment-box");

        const commentUser = document.createElement('li');
        commentUser.setAttribute('class', "comment-user");

          const tCUImg = document.createElement('div');
          tCUImg.setAttribute('class', "t-c-u-img");

            const tCommUImg = document.createElement('img');
            tCommUImg.setAttribute('class', "t-comm-u-img");
            tCommUImg.setAttribute('src', uImage);

          const tCommUName = document.createElement('div');
          tCommUName.setAttribute('class', "t-c-u-name");

        const commentText = document.createElement('li');
        commentText.setAttribute('class', "comment-text");

        const commentDeleteBtn = document.createElement('li');
        commentDeleteBtn.setAttribute('class', "comment-delete-btn");

          const tCommDelBtn = document.createElement('a');
          tCommDelBtn.setAttribute('class', "t-comm-del-btn");
          tCommDelBtn.setAttribute('rel', "nofollow");
          tCommDelBtn.setAttribute('data-method', "delete");
          tCommDelBtn.setAttribute('data-remote', "true");
          tCommDelBtn.setAttribute('href', `/tweets/${data.tweet.id}/comments/${data.comment.id}`);


    // if ( comments === null ){
    // comments.insertBefore(tweetId, comments.lastElementChild.nextSibling);
    
    // tweetId.appendChild(tweetComment);
    // tweetComment.appendChild(commentBox);
    // commentBox.appendChild(commentUser);
    // commentBox.appendChild(commentText);
    // commentBox.appendChild(commentDeleteBtn);
    // commentDeleteBtn.appendChild(tCommDelBtn);
    // commentUser.appendChild(tCUImg);
    // tCUImg.appendChild(tCommUImg);
    // commentUser.appendChild(tCommUName);

    // tCommUImg.innerHTML = uImage
    // tCommUName.innerHTML = name
    // commentText.innerHTML = comment
    // tCommDelBtn.innerHTML = 'delete'

    // const newComment = document.getElementById('comment_comment');
    // newComment.value='';
    // }
    // else {

    // comments.parentElement.insertBefore(tweetId, comments.firstChild.nextSibling);
    comments.insertBefore(tweetId, comments.firstChild);

    tweetId.appendChild(tweetComment);
    tweetComment.appendChild(commentBox);
    commentBox.appendChild(commentUser);
    commentBox.appendChild(commentText);
    commentBox.appendChild(commentDeleteBtn);
    commentDeleteBtn.appendChild(tCommDelBtn);
    commentUser.appendChild(tCUImg);
    tCUImg.appendChild(tCommUImg);
    commentUser.appendChild(tCommUName);

    tCommUImg.innerHTML = uImage
    tCommUName.innerHTML = name
    commentText.innerHTML = comment
    tCommDelBtn.innerHTML = 'delete'

    const newComment = document.getElementById('comment_comment');
    newComment.value='';
    // }
  }
});
