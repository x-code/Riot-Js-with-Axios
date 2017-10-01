<app>
    <div class="container"> 
    <div class="row"> 
    <div class="col-md-12">
        <header name="header" class="header"></header>
            <div class="top-bar">
            <div class="form-group pull-left">
                <button type="button" class="btn btn-primary" onclick="{actAdd}"> Create <span class="glyphicon glyphicon-pencil"></span></button>
            </div>
            
            <div class="form-group  pull-right">
              <input class="form-control" name="searchbar" type="text" onkeyup={ search } placeholder="Search for title, content & author.."/>
              </div>
              <div class="form-group pull-right">
              <select class="form-control" name="filter-data" onchange={search}>
                <option value="title">By Title</option>
                <option value="content">By Content</option>
                <option value="author">By Author</option>
              </select>
            </div>
            </div>
            <div class="col-md-12">
            <table class="table table-hover table-striped">
               <thead>
                  <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Author</th>
                        <th>Created at</th>
                        <th>Updated at</th>
                        <th>action</th>
                  </tr>
               </thead>
               <tbody>
                  <tr class="post" each={ filteredPosts } title={ title } author={ author } date={ date } content={ content }>
                    <td>{title}</td>
                     <td>{content}</td>
                     <td>{author}</td>
                     <td>{created_at}</td>
                      <td>{updated_at}</td>
                     <td><button type="button" class="btn btn-primary btn-xs" onclick="{actEdit.bind(this, id) }" data-id="{id}" data-toggle="modal" data-target="#edit-modal"><span class="glyphicon glyphicon-pencil"></span></button> <button type="button" class="btn btn-danger btn-xs" onclick="{actDelete.bind(this, id, title) }" > <span class="glyphicon glyphicon-trash"></span></button></td>
                  </tr>
               </tbody>
            </table>
            
            <div class="clearfix"></div>
            <ul class="pagination pull-right">
               <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
               <li class="active"><a href="#">1</a></li>
               <li><a href="#">2</a></li>
               <li><a href="#">3</a></li>
               <li><a href="#">4</a></li>
               <li><a href="#">5</a></li>
               <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </ul>
            </div>
          <!-- try it out with two yields! -->
       <!-- <yield /> -->

        <div class="col-md-12">
          <div class="push"></div>
          <footer name="footer" class="footer"></footer>
        </div>

        <modal-custom></modal-custom>

    </div>
  </div>
</div


    <script>
        actAdd() {
          el = document.getElementById("add-modal");
          el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
        }

        actEdit (id) {
        console.log(id);
         axios.get(rootUrl+'/'+id)
                .then(function(response) {
                    console.log(response);
                    document.getElementById("update-id").value = response.data.id;
                     document.getElementById("update-title").value = response.data.title;
                    document.getElementById("update-content").value = response.data.content;
                    el = document.getElementById("edit-modal");
                    el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
                })
                .catch(function(error) {
                    console.log('error');
                });
        };

        actDelete (id,title) {
          console.log(title);
          document.getElementById("delete-id").value = id;
          document.getElementById("delete-title").innerHTML = title;
          el = document.getElementById("delete-modal");  
          el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
        }

        function shortenString(source_string, max_length) {
            var short = source_string.substr(0, max_length);
            if (/^\S/.test(source_string.substr(max_length)))
                return short.replace(/\s+\S*$/, "") + '...';
            return short;
        };

        var allPosts = opts.data;
        this.filteredPosts = allPosts;

        this.search = function() {
            var query = this.searchbar.value ? this.searchbar.value.split(' ') : [];
            console.log(this.searchbar.value);
            var filterData = this['filter-data'].value;
            console.log(filterData);

           
            var titlePosts = [];
            var contentPosts = [];
            var authorPosts = [];

            if (filterData == 'title') {
             titlePosts = allPosts.filter(function(item) {
                    return item.title.indexOf(query) > -1;
                });
            }

            if (filterData == 'content') {
             contentPosts = allPosts.filter(function(item) {
                    return item.content.indexOf(query) > -1;
                });
            }

            if (filterData == 'author') {
             authorPosts = allPosts.filter(function(item) {
                    return item.author.indexOf(query) > -1;
                });
            }

            var filteredPosts = titlePosts.concat(contentPosts).concat(authorPosts);
            this.filteredPosts = filteredPosts;
        };
    </script>
</app>

