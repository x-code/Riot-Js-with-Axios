<modal-custom>
	<div id="add-modal" class="pop-modal">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" onclick="{closeAdd}"><span>&times;</span></button>
                  <h4 class="modal-title">Create Article</h4>
                </div>
                <div class="modal-body">
                   <form class="form-horizontal">
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-10">
                       <input type="text" class="form-control" id="add-title" placeholder="title berita">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="content">Content:</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" id="add-content" placeholder="content berita"></textarea>
                    </div>
                  </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" onclick="{closeAdd}">Close</button>
                  <button type="button" onclick="{addData}" class="btn btn-primary">Save</button>
                </div>
              </div>
            </div>
          </div>

        <div id="edit-modal" class="pop-modal">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" onclick="{closeEdit}"><span>&times;</span></button>
                  <h4 class="modal-title">Update Article</h4>
                </div>
                <div class="modal-body">
                   <form class="form-horizontal">
                   <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title:</label>
                    <div class="col-sm-10">
                      <input type="hidden" class="form-control" id="update-id">
                       <input type="text" class="form-control" placeholder="title berita" id="update-title">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="content">Content:</label>
                    <div class="col-sm-10">
                       <textarea class="form-control" placeholder="content berita" id="update-content"></textarea>
                    </div>
                  </div>   
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" onclick="{closeEdit}">Close</button>
                  <button type="button" onclick="{updateData}" class="btn btn-primary">Save</button>
                </div>
              </div>
            </div>
          </div>

          <div id="delete-modal" class="pop-modal">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" onclick="{closeDelete}"><span>&times;</span></button>
                  <h4 class="modal-title">Delete Article</h4>
                </div>
                <div class="modal-body">
                   Are you want to delete this article?
                   <h2 id="delete-title"></h2>
                   <input type="hidden" id="delete-id" />
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" onclick="{closeDelete}">Close</button>
                  <button type="button" onclick="{deleteData}" class="btn btn-primary">Delete</button>
                </div>
              </div>
            </div>
          </div>

      <script>
        closeAdd() {
          el = document.getElementById("add-modal");
          el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
        }

        addData(){
          title = document.getElementById("add-title").value;
          content = document.getElementById("add-content").value;
          axios.post(rootUrl, {
                'title': title,
                'content': content,
            })
              .then(function(data) {
                  console.log(data);
                  window.top.location.reload(true);
                    
              })
                .catch(function(error) {
                    console.log('error');
          });
        };

        closeEdit() {
          el = document.getElementById("edit-modal");
          el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
        }

        updateData(){
          id = document.getElementById("update-id").value;
          title = document.getElementById("update-title").value;
          content = document.getElementById("update-content").value;
          console.log(id);
          axios.patch(rootUrl+'/'+id, {
                'title': title,
                'content': content,
            })
            .then(function(data) {
                window.top.location.reload(true);
                    
            })
            .catch(function(error) {
                console.log('error');
          });
        };

        closeDelete() {
          el = document.getElementById("delete-modal");
          el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
        }

        deleteData(){
          id = document.getElementById("delete-id").value;
          console.log(id);
          axios.delete(rootUrl+'/'+id)
                .then(function(data) {
                    console.log(data);
                    window.top.location.reload(true);
                })
                .catch(function(error) {
                    console.log('error');
          });
        };



        </script>
</modal-custom>