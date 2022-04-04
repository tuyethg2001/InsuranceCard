$(document).ready(function () {
    $('.summernote').summernote({
        airMode: false,
        placeholder: 'Enter content....',
        tabsize: 2,
        height: 200,
        minHeight: 100,
        maxHeight: window.innerHeight - 300,
        focus: true,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['undo', 'redo', 'fullscreen', 'codeview', 'help']]
        ],
        popover: {
            image: [
                ['image', ['resizeNone', 'resizeFull', 'resizeHalf', 'resizeQuarter']],
                ['float', ['floatLeft', 'floatRight', 'floatNone']],
                ['remove', ['removeMedia']]
            ],
            link: [
                ['link', ['linkDialogShow', 'unlink']]
            ],
            table: [
                ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
                ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
            ],
            air: [
                ['color', ['color']],
                ['font', ['bold', 'underline', 'clear']],
                ['para', ['ul', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
            ]
        },
        codemirror: {
            theme: 'monokai'
        },
    });
    
    
    
    //fix embed video responsive
//    $('.note-video-clip').each(function () {
//        var tmp = $(this).wrap('<p/>').parent().html();
//        $(this).parent().html('<div class="embed-responsive embed-responsive-16by9">' + tmp + '</div>');
//    });
    //fix editor image and video responsive
//    $("div.note-editor").click(function () {
//        $('div.note-editor img').css({'max-width': '100%'});
//        $('div.note-editor iframe').css({'max-width': '100%'});
//    });
});
