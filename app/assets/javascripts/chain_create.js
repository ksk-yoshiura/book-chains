$(function() {

$(document).on("click", ".new-chain-btn-add", function () {
    
  $(this).parent().parent().remove();
  var bookId = $(this).data('book-id');
  var bookTitle = $(this).data('book-title');
  var bookAuthor = $(this).data('book-author');
  var bookImage = $(this).data('book-image');
  var bookCreated_at = $(this).data('book-created_at');
  var addHTML = 
        `<li class="card" style="min-width:20%; max-width:20%" >
          <img class="card-img-top" src="${bookImage}" alt="" >
            <div class="card-body">
              <p class="card-title">${bookTitle}</p>
              <p>著者 : ${bookAuthor}</P>
              
              <button class="btn btn-danger new-chain-btn-remove" 
                data-book-id="${bookId}" data-book-title="${bookTitle}" 
                data-book-author="${bookAuthor}" data-book-image="${bookImage}" 
                data-book-created_at="${bookCreated_at}" >削除</button>
            </div>
          <input type="hidden" name="chain[book_ids][]" value="${bookId}">
        </li>`;
  $("#make-new-chain").append(addHTML);
});

$(document).on("click", ".new-chain-btn-remove", function () {
  
  $(this).parent().parent().remove();
  var bookId = $(this).data('book-id');
  var bookTitle = $(this).data('book-title');
  var bookAuthor = $(this).data('book-author');
  var bookImage = $(this).data('book-image');
  var bookCreated_at = $(this).data('book-created_at');
  var returnHTML =
        `<li class="card" style="min-width:20%; max-width:20%">
          <img class="card-img-top" src="${bookImage}" alt="" >
            <div class="card-body">
              <p class="card-title">${bookTitle}</p>
              <p>著者 : ${bookAuthor}</P>
              <p>登録日 : <br>${bookCreated_at}</P>
              
              <button class="btn btn-primary new-chain-btn-add" 
              data-book-id="${bookId}" data-book-title="${bookTitle}"
              data-book-author="${bookAuthor}" data-book-created_at="${bookCreated_at}"
              data-book-image="${bookImage}">追加</button>
            </div>
        </li>`;
  $("#bookshelf").append(returnHTML);
});
});