import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<li>${data.content.comment}</li>`;
    const comments = document.getElementById('tweet-comments');
    comments.insertAdjacentHTML('beforeend', html);

    const newComment = document.getElementById('comment_comment');
    newComment.value='';
  }
});
