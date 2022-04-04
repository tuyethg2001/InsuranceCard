
function search() {
    if (document.getElementById("input-search").value != "") {
        document.getElementById("searchForm").submit();
    } else {
        Swal.fire({
            timer: 2000,
            position: 'top',
            text: 'Date field is empty!',
            icon: 'warning',
            showConfirmButton: true,
            confirmButtonColor: '#FF96A3',
            allowEnterKey: true
        })
    }
}

function createPagger(url, div, before, pageIndex, after, gap, totalPage) {
    var container = document.getElementById(div);
    if (totalPage > 1) {
        if (pageIndex - 1 > 0) {
            container.innerHTML += '<a class="move" href="' + url + 'page=' + before + '"><span class="iconify" data-icon="codicon:triangle-left"></span></a>';
        } else {
            container.innerHTML += '<a class="move" onclick="return false;"><span class="iconify" data-icon="codicon:triangle-left"></span></a>';
        }

        if (pageIndex - gap > 1) {
            container.innerHTML += '<a href="' + url + 'page=1"><span class="iconify" data-icon="bx:first-page"></span></a>';
        }

        for (var i = pageIndex - gap; i < pageIndex; i++) {
            if (i > 0) {
                container.innerHTML += '<a href="' + url + 'page=' + i + '">' + i + '</a>';
            }
        }

        container.innerHTML += '<span class="page">' + pageIndex + '</span>';

        for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
            if (i <= totalPage) {
                container.innerHTML += '<a href="' + url + 'page=' + i + '">' + i + '</a>';
            }
        }

        if (pageIndex + gap < totalPage) {
            container.innerHTML += '<a href="' + url + 'page=' + totalPage + '"><span class="iconify" data-icon="bx:last-page"></span></a>';
        }

        if (pageIndex + 1 <= totalPage) {
            container.innerHTML += '<a class="move" href="' + url + 'page=' + after + '"><span class="iconify" data-icon="codicon:triangle-right"></span></a>';
        } else {
            container.innerHTML += '<a class="move" onclick="return false;"><span class="iconify" data-icon="codicon:triangle-right"></span></a>';
        }
    }
}

