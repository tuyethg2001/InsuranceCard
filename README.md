# InsuranceCard

## Cách thao tác với Github của Team 1<br>

### Các loại branch
1. main
   - branch gốc dùng để deploy sản phẩm, phải luôn sẵn sàng và không được chỉnh sửa gì
   - Các brach con mỗi khi tạo mới đều phải clone từ brach main ra
2. branch con
   - Đặt theo tên của người làm. Mỗi người khi phát triển sẽ đặt theo [tên]-[Mã tính năng] VD: Huy-Login
   - Khi cần tạo thêm 1 brach phụ để phát triển song song thì tạo mới kể từ bản thứ 2 với mẫu [tên]-[Mã tính năng]-[số thứ tự] VD: Huy-Login-1. branch này và branch con chính có thể được tự merge vào nhau mà không cần leader phê duyệt, sau khi merge vào branch con chính thì tiếp tục như bình thường
   - Mỗi lần phát triển xong 1 tính năng thì push lên github trước, rồi mới tạo pull request (Create pull request)
   - Sau khi được assignee duyệt và merge vào main thì xóa branch con liên quan của mình đi
   - Mỗi lần tiếp tục bắt đầu phát triển một tính năng mới thì tạo một branch mới và merge từ branch main vào để được phiên bản mới nhất

### Quy ước khi push code lên remote
1. Commit Code
   - Liên tục commit code lên [branch con] của bản thân mỗi khi có thể để tránh mất code khi xảy ra vấn đề
   - Ghi summary (Bằng Tiếng anh) tóm tắt phiên bản code của mình có ý nghĩa, tóm tắt phần mình vừa làm (Không ghi linh tinh) 
   - Ghi Description chi tiết nếu có <br> 
  
    ![Mô tả summary và description trong Github desktop](https://i.ibb.co/WtNzYNY/image.png)

1. Tạo pull request, merge vào main<br>
   *(Pull request - yêu cầu assignee phê duyệt code của mình trước khi nó được merge vào bất kì branch nào gồm main và [branch con] khác)*

   ![Mô tả pull request](https://i.ibb.co/LJm9V6z/image.png)
   
   - Chỉ tạo pull request sau khi phát triển hoàn thiện tính năng của mình và chạy thành công
   - Chỉ được phép tạo pull request merge trên remote github, **KHÔNG** tự merge vào main ở local trên máy rồi tự ý push lên main
   - Tạo pull request và ghi comment đầy đủ lên github, không trao đổi bên ngoài, (mọi điều, ghi chú, trao đổi liên quan tới việc merge vào main thì thông qua comment)
2. Assignee theo dõi và kiểm tra merge<br>
   *(Assignee có thể là leader hoặc là thành viên phụ trách)*
   - **KHÔNG** tự ý phê duyệt code của bản thân mỗi khi merge vào main
   - Nếu assignee reject, comment và yêu cầu sửa code thì người phụ trách phát triển branch ấy sẽ sửa lại code và push lại. Việc này sẽ tiến hành tới khi nào được assignee chấp nhận.
   - Khi không còn vấn đề nào nữa thì assignee sẽ merge và delete branch ấy đi.

