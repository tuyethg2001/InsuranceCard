<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link
        rel="icon"
        href="${pageContext.servletContext.contextPath}/asset/image/favicon.png"
        type="image/png"
        sizes="16x16"
        />
    <jsp:include page="../header_moderator.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insurance Card</title>
        <base href="${pageContext.servletContext.contextPath}/" />
        <link rel="stylesheet" href="asset/style/moderator/staff_update.css" />
    </head>
    <body>
        <main>
            <div class="card">
                <h1 class="card__heading">Update Staff</h1>

                <div class="mess-box mess-box--danger" 
                     style="${requestScope.isExistEmail ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_close.png" alt="" class="mess-box__icon" />
                    <p class="mess-box__mess">The email address is duplicated!</p>
                </div>

                <div class="mess-box mess-box--success" 
                     style="${requestScope.isSuccess ? "display:flex;" : "display:none;"}">
                    <img src="asset/image/staff/customer_create_edit/icon_approve.png" class="mess-box__icon" />
                    <p class="mess-box__mess">Your changes have been successfully saved</p>
                </div>

                <form action="moderator/staff/update" method="POST"
                      class="card__form" onSubmit="return submitForm(this);">                 
                    <input type="hidden" name="id" value="${requestScope.staff.account.id}">

                    <div class="card__list">
                        <div class="card__item">
                            <label class="card__label" for="email">Email</label>

                            <input
                                id="email"
                                class="card__input"
                                type="text"
                                name="email"
                                value="${requestScope.staff.account.email}"
                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                required
                                />
                        </div>

                        <div class="card__item">
                            <label class="card__label" for="status">Status</label>

                            <select name="status" class="card__input" id="status" required>
                                <option ${requestScope.staff.account.statusCode.statusCode == 0 ? "selected" : ""} 
                                    value="0">Inactive</option>
                                <option ${requestScope.staff.account.statusCode.statusCode == 1 ? "selected" : ""}
                                    value="1">Active</option>
                                <option ${requestScope.staff.account.statusCode.statusCode == 2 ? "selected" : ""}
                                    value="2" disabled>Pending</option>
                            </select>
                        </div>

                        <div class="card__item">
                            <label class="card__label" for="firstName">First Name</label>

                            <input
                                id="firstName"
                                class="card__input"
                                type="text"
                                name="fname"
                                value="${requestScope.staff.firstName}"
                                pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                required
                                />
                        </div>

                        <div class="card__item">
                            <label class="card__label" for="lastName">Last Name</label>

                            <input
                                id="lastName"
                                class="card__input"
                                type="text"
                                name="lname"
                                value="${requestScope.staff.lastName}"
                                pattern="/[^a-z0-9A-Z_\x{00C0}-\x{00FF}\x{1EA0}-\x{1EFF}]/u"
                                required
                                />
                        </div>

                        <div class="card__item">
                            <label class="card__label" for="phone">Phone</label>

                            <input
                                id="phone"
                                class="card__input"
                                type="text"
                                name="phone"
                                value="${requestScope.staff.phone}"
                                pattern="0[0-9]{9}"
                                required
                                />
                        </div>
                    </div>

                    <div class="card__btn">
                        <input class="btn btn--primary" type="submit" value="Update" />
                        <a class="btn btn--secondary"
                           onclick="confirmBox('Are you sure you want to cancel? Your changes will not be saved.', 'moderator/staff/view')">Cancel</a>
                    </div>
                </form>
            </div>
        </main>

        <!-- confirm box -->
        <script>
            function confirmBox(mess, url) {
                if (confirm(mess)) {
                    location.href = url;
                }
            }

            function submitForm() {
                return confirm('Do you really want to submit the form?');
            }
        </script>
    </body>

    <jsp:include page="../footer_full.jsp">
        <jsp:param name="currentscreen" value="customer" />
    </jsp:include>
</html>
