
json.id      @book.id
json.author  @book.author
json.title   @book.title
json.image   @book.image
json.created_at  @book.created_at.strftime("%Y-%m-%d %H:%M")