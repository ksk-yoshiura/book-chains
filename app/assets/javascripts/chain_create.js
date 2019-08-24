$(function() {

  


$(document).on("click", ".new-chain-btn-add", function () {
    
  $(this).parent().parent().remove();
  var bookId = $(this).data('book-id');
  var bookTitle = $(this).data('book-title');
  var bookAuthor = $(this).data('book-author');
  var bookImage = $(this).data('book-image');
  var bookCreated_at = $(this).data('book-created_at');
  var addHTML = `<div class="card" style="min-width:20%; max-width:20%">
  <img class="card-img-top" src="${bookImage}" alt="">
    <div class="card-body">
      <h4 class="card-title">${bookTitle}</h4>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><p>Author:${bookAuthor}</P></li>
        <li class="list-group-item"><p>RegistrationDate:${bookCreated_at}</P></li>
      </ul>
      <button class="btn btn-danger new-chain-btn-remove" 
      data-book-id="${bookId}" data-book-title="${bookTitle}" 
      data-book-author="${bookAuthor}" data-book-image="${bookImage}" 
      data-book-created_at="${bookCreated_at}" >Remove</button>
    </div>
    <input type="hidden" name="chain[book_ids][]" value="${bookId}" />
    </div>`;
  $("#make-new-chain").append(addHTML);
});

$(document).on("click", ".new-chain-btn-remove", function () {
  
  $(this).parent().parent().remove();
  var bookId = $(this).data('book-id');
  var bookTitle = $(this).data('book-title');
  var bookAuthor = $(this).data('book-author');
  var bookImage = $(this).data('book-image');
  var bookCreated_at = $(this).data('book-created_at');
  var returnHTML = `<div class="card" style="min-width:20%; max-width:20%">
  <img class="card-img-top" src="${bookImage}" alt="">
    <div class="card-body">
      <h4 class="card-title">${bookTitle}</h4>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><p>Author:${bookAuthor}</P></li>
        <li class="list-group-item"><p>RegistrationDate:${bookCreated_at}</P></li>
      </ul>
      <button class="btn btn-primary new-chain-btn-add" 
      data-book-id="${bookId}" data-book-title="${bookTitle}" 
      data-book-author="${bookAuthor}" data-book-image="${bookImage}" 
      data-book-created_at="${bookCreated_at}">Add</button>
    </div>
    </div>`;
  $("#bookshelf").append(returnHTML);
});
});