import os
import stat
import pwd
import grp

def check_and_fix_permissions(path, default_user='root', default_group='root'):
    """
    Kiểm tra và sửa quyền cũng như chủ sở hữu của thư mục hoặc tập tin trong đường dẫn.
    """
    # Lấy UID và GID của chủ sở hữu mặc định
    default_uid = pwd.getpwnam(default_user).pw_uid
    default_gid = grp.getgrnam(default_group).gr_gid

    # Kiểm tra và sửa quyền cho chính đường dẫn gốc mà người dùng cung cấp
    if os.path.isdir(path):
        check_and_fix_directory(path, default_uid, default_gid)
    else:
        check_and_fix_file(path, default_uid, default_gid)

    # Kiểm tra đệ quy tất cả các tệp và thư mục bên trong
    for root, dirs, files in os.walk(path):
        for dir_name in dirs:
            dir_path = os.path.join(root, dir_name)
            check_and_fix_directory(dir_path, default_uid, default_gid)

        for file_name in files:
            file_path = os.path.join(root, file_name)
            check_and_fix_file(file_path, default_uid, default_gid)

def check_and_fix_directory(directory_path, default_uid, default_gid):
    """
    Kiểm tra và sửa quyền và chủ sở hữu của thư mục.
    """
    default_permission = 0o755
    current_permission = stat.S_IMODE(os.lstat(directory_path).st_mode)

    # Sửa quyền nếu không đúng
    if current_permission != default_permission:
        print(f"Sửa quyền của thư mục: {directory_path} từ {oct(current_permission)} thành {oct(default_permission)}")
        os.chmod(directory_path, default_permission)

    # Kiểm tra và sửa chủ sở hữu
    current_uid = os.lstat(directory_path).st_uid
    current_gid = os.lstat(directory_path).st_gid
    if current_uid != default_uid or current_gid != default_gid:
        print(f"Sửa chủ sở hữu của thư mục: {directory_path} thành {default_uid}:{default_gid}")
        os.chown(directory_path, default_uid, default_gid)

def check_and_fix_file(file_path, default_uid, default_gid):
    """
    Kiểm tra và sửa quyền và chủ sở hữu của tệp tin.
    """
    # Quyền mặc định cho tệp tin thực thi và không thực thi
    default_exec_permission = 0o755
    default_file_permission = 0o644

    # Lấy quyền hiện tại của tệp
    current_permission = stat.S_IMODE(os.lstat(file_path).st_mode)

    # Kiểm tra nếu tệp là tệp thực thi
    if os.access(file_path, os.X_OK):
        if current_permission != default_exec_permission:
            print(f"Sửa quyền của tệp thực thi: {file_path} từ {oct(current_permission)} thành {oct(default_exec_permission)}")
            os.chmod(file_path, default_exec_permission)
    else:
        if current_permission != default_file_permission:
            print(f"Sửa quyền của tệp không thực thi: {file_path} từ {oct(current_permission)} thành {oct(default_file_permission)}")
            os.chmod(file_path, default_file_permission)

    # Kiểm tra và sửa chủ sở hữu
    current_uid = os.lstat(file_path).st_uid
    current_gid = os.lstat(file_path).st_gid
    if current_uid != default_uid or current_gid != default_gid:
        print(f"Sửa chủ sở hữu của tệp tin: {file_path} thành {default_uid}:{default_gid}")
        os.chown(file_path, default_uid, default_gid)

    # Kiểm tra và sửa cờ setuid cho tệp /usr/bin/sudo
    if file_path == '/usr/bin/sudo':
        sudo_permissions = stat.S_IMODE(os.lstat(file_path).st_mode)
        if sudo_permissions != 0o4755:
            print(f"Sửa quyền của /usr/bin/sudo từ {oct(sudo_permissions)} thành 4755 (setuid)")
            os.chmod(file_path, 0o4755)

def check_and_fix_important_files():
    """
    Kiểm tra và sửa các tệp hệ thống quan trọng liên quan đến sudo và root.
    """
    important_files = {
        '/usr/bin/sudo': {'permissions': 0o4755, 'owner': 'root', 'group': 'root'},
        '/etc/sudoers': {'permissions': 0o440, 'owner': 'root', 'group': 'root'},
        '/etc/sudo.conf': {'permissions': 0o644, 'owner': 'root', 'group': 'root'},
    }

    for file_path, settings in important_files.items():
        if os.path.exists(file_path):
            default_uid = pwd.getpwnam(settings['owner']).pw_uid
            default_gid = grp.getgrnam(settings['group']).gr_gid

            # Kiểm tra và sửa quyền sở hữu
            current_uid = os.lstat(file_path).st_uid
            current_gid = os.lstat(file_path).st_gid
            if current_uid != default_uid or current_gid != default_gid:
                print(f"Sửa chủ sở hữu của {file_path} thành {settings['owner']}:{settings['group']}")
                os.chown(file_path, default_uid, default_gid)

            # Kiểm tra và sửa quyền truy cập
            current_permission = stat.S_IMODE(os.lstat(file_path).st_mode)
            if current_permission != settings['permissions']:
                print(f"Sửa quyền của {file_path} từ {oct(current_permission)} thành {oct(settings['permissions'])}")
                os.chmod(file_path, settings['permissions'])
        else:
            print(f"Cảnh báo: {file_path} không tồn tại.")

if __name__ == "__main__":
    path = input("Nhập đường dẫn bạn muốn kiểm tra và sửa quyền: ")
    default_user = input("Nhập tên người dùng mặc định (ví dụ: root): ")
    default_group = input("Nhập tên nhóm mặc định (ví dụ: root): ")

    if os.path.exists(path):
        # Tự động kiểm tra và sửa các quyền của đường dẫn được chỉ định
        check_and_fix_permissions(path, default_user, default_group)
        
        # Tự động kiểm tra và sửa các tệp hệ thống quan trọng liên quan đến sudo
        check_and_fix_important_files()
    else:
        print("Đường dẫn không tồn tại!")
