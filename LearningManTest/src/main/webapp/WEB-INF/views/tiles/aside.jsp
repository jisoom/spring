<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- elevation-4(sidebar 옆에 그림자) 지움 -->
<aside id="aside" class="main-sidebar sidebar-dark-primary">
    <!-- Brand Logo -->
    <a href="#" id="brand-link" class="brand-link">
    	<!-- img-circle랑 elevation-3 지움 -->
      <img src="/resources/images/logo4.png" alt="AdminLTE Logo" class="brand-image" style="opacity: .8">
      <span class="brand-text font-weight-light">Learning Man</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div id="user-panel" class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/resources/adminlte/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">로그인을 해주세요.</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
<!-- 		<div class="form-inline">
			<div class="input-group">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
			<div class="sidebar-search-results">
				<div class="list-group">
					<a href="#" class="list-group-item"><div class="search-title">
							<strong class="text-light"></strong>N<strong class="text-light"></strong>o<strong
								class="text-light"></strong> <strong class="text-light"></strong>e<strong
								class="text-light"></strong>l<strong class="text-light"></strong>e<strong
								class="text-light"></strong>m<strong class="text-light"></strong>e<strong
								class="text-light"></strong>n<strong class="text-light"></strong>t<strong
								class="text-light"></strong> <strong class="text-light"></strong>f<strong
								class="text-light"></strong>o<strong class="text-light"></strong>u<strong
								class="text-light"></strong>n<strong class="text-light"></strong>d<strong
								class="text-light"></strong>!<strong class="text-light"></strong>
						</div>
						<div class="search-path"></div></a>
				</div>
			</div>
		</div> -->

		<!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-home"></i>
              <p>
                Homepage
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-info-circle"></i>
              <p>
              	소개
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>학원 소개</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>학원 시간표</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>찾아오시는 길</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-bullhorn"></i>
              <p>
              	커뮤니티
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="charts/chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="charts/flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>신입 상담 예약 신청</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="charts/inline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>차량 노선 조회</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-chalkboard-teacher"></i>
              <p>
              	강의
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="UI/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <!-- 수강생 -->
                  <p>내 수강 목록</p>
                  <!-- 강사 -->
                  <p>내 강의 목록</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="UI/icons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>강의 시간표</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-file-alt"></i>
              <p>
              	온라인 시험
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>시험 목록</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <!-- 강사만 -->
                  <p>시험 출제</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <!-- 수강생만 -->
                  <p>점수 확인</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>오답노트</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-book-open"></i>
              <p>
              	퀴즈 러닝
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>퀴즈 단어장 목록</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>즐겨찾기</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>검색</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-edit"></i>
              <p>
              	내 정보
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <!-- 강사, 수강생 -->
                  <p>정보 상세</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <!-- 수강생만 -->
                  <p>수강료 납부 내역</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-envelope"></i>
              <p>
              	<!-- 강사, 관리자만 -->
              	업무 쪽지
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>쪽지 보내기</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>보낸 쪽지함</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>받은 쪽지함</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link borderBottom1">
              <i class="nav-icon fas fa-cog"></i>
              <p>
              	관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>수강생 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>직원 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>강의 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>운영 일정 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>문자 및 카톡 보내기</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>신입 상담 예약 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>매출 관리</p>
                </a>
              </li>
              <li class="nav-item marginLeft10">
                <a href="tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>등하원 노선 관리</p>
                </a>
              </li>
            </ul>
          </li>
<!--           <li class="nav-header">EXAMPLES</li>
          <li class="nav-item">
            <a href="calendar.html" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Calendar
                <span class="badge badge-info right">2</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="gallery.html" class="nav-link">
              <i class="nav-icon far fa-image"></i>
              <p>
                Gallery
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="kanban.html" class="nav-link">
              <i class="nav-icon fas fa-columns"></i>
              <p>
                Kanban Board
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Mailbox
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="mailbox/mailbox.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbox</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="mailbox/compose.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Compose</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="mailbox/read-mail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Read</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
                Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="examples/invoice.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Invoice</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/profile.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/e-commerce.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>E-commerce</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/projects.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/project-add.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Add</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/project-edit.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Edit</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/project-detail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Detail</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/contacts.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/faq.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>FAQ</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/contact-us.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contact us</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Extras
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Login &amp; Register v1
                    <i class="fas fa-angle-left right"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="examples/login.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Login v1</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/register.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Register v1</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/forgot-password.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Forgot Password v1</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/recover-password.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Recover Password v1</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Login &amp; Register v2
                    <i class="fas fa-angle-left right"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="examples/login-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Login v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/register-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Register v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/forgot-password-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Forgot Password v2</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="examples/recover-password-v2.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Recover Password v2</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="examples/lockscreen.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Lockscreen</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/legacy-user-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Legacy User Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/language-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Language Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/404.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 404</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/500.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 500</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/pace.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pace</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="examples/blank.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Blank Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../starter.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Starter Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-search"></i>
              <p>
                Search
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="search/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Search</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="search/enhanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Enhanced</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">MISCELLANEOUS</li>
          <li class="nav-item">
            <a href="../iframe.html" class="nav-link">
              <i class="nav-icon fas fa-ellipsis-h"></i>
              <p>Tabbed IFrame Plugin</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="https://adminlte.io/docs/3.1/" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>Documentation</p>
            </a>
          </li>
          <li class="nav-header">MULTI LEVEL EXAMPLE</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
                Level 1
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Level 2
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>  -->
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  