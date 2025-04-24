#!/bin/bash

add_user() {
    read -p "Enter the username to add: " username
    id "$username" &> /dev/null
    if [ $? -ne 0 ]; then
        useradd "$username"
        echo "User $username has been added."
    else
        echo "User $username already exists."
    fi
}

modify_user() {
    read -p "Enter the username to modify: " username
    read -p "Enter the new username (leave empty to skip): " new_username
    if [ -n "$new_username" ]; then
        usermod -l "$new_username" "$username"
        echo "User $username has been renamed to $new_username."
    fi
}

delete_user() {
    read -p "Enter the username to delete: " username
    userdel "$username"
    echo "User $username has been deleted."
}

list_users() {
    echo "List of all users:"
    cut -d: -f1 /etc/passwd
}

add_group() {
    read -p "Enter the group name to add: " groupname
    groupadd "$groupname"
    echo "Group $groupname has been added."
}

modify_group() {
    read -p "Enter the group name to modify: " groupname
    read -p "Enter the new group name (leave empty to skip): " new_groupname
    if [ -n "$new_groupname" ]; then
        groupmod -n "$new_groupname" "$groupname"
        echo "Group $groupname has been renamed to $new_groupname."
    fi
}

delete_group() {
    read -p "Enter the group name to delete: " groupname
    groupdel "$groupname"
    echo "Group $groupname has been deleted."
}

list_groups() {
    echo "List of all groups:"
    cut -d: -f1 /etc/group
}

disable_user() {
    read -p "Enter the username to disable: " username
    usermod -L "$username"
    echo "User $username has been locked (disabled)."
}

enable_user() {
    read -p "Enter the username to enable: " username
    usermod -U "$username"
    echo "User $username has been unlocked (enabled)."
}

change_password() {
    read -p "Enter the username to change password: " username
    passwd "$username"
}


if [ $UID -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

PS3="Select Num of Option >> "
select option in "AddUser" "ModifyUser" "DeleteUser" "ListUsers" "AddGroup" "ModifyGroup" "DeleteGroup" "ListGroups" "DisableUser" "EnableUser" "ChangePassword" "Exit"
do
    case $option in 
        AddUser) add_user ;;
        ModifyUser) modify_user ;;
        DeleteUser) delete_user ;;
        ListUsers) list_users ;;
        AddGroup) add_group ;;
        ModifyGroup) modify_group ;;
        DeleteGroup) delete_group ;;
        ListGroups) list_groups ;;
        DisableUser) disable_user ;;
        EnableUser) enable_user ;;
        ChangePassword) change_password ;;
        Exit) echo "Exiting..."; break ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done

