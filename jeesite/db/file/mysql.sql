/*==============================================================*/
/* Table: common_file                                           */
/*==============================================================*/
create table common_file
(
   id                   int auto_increment,
   name                 varchar(100),
   type                 varchar(20),
   version              smallint,
   size                 int,
   user_id              varchar(64),
   edit_time            datetime,
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: common_folder                                         */
/*==============================================================*/
create table common_folder
(
   id                   int auto_increment,
   name                 varchar(50),
   size                 int,
   parent_id            int,
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: common_file_store                                     */
/*==============================================================*/
create table common_file_store
(
   folder_id            int,
   file_id              int,
   PRIMARY KEY (folder_id,file_id)
);

/*==============================================================*/
/* Table: common_file_version                                   */
/*==============================================================*/
create table common_file_version
(
   file_id              int,
   version              smallint,
   name                 varchar(30),
   size                 int,
   user_id              varchar(64),
   update_time          datetime,
   PRIMARY KEY (file_id,version)
);

/*==============================================================*/
/* Table: user_folder                                           */
/*==============================================================*/
create table user_folder
(
   user_id              varchar(64),
   folder_id            int,
   size                 int,
   type                 smallint comment '0:私有 1:共享',
   PRIMARY KEY (user_id,folder_id)
);

/*==============================================================*/
/* Table: org_folder                                            */
/*==============================================================*/
create table org_folder
(
   org_id               varchar(64),
   folder_id            int,
   size                 int,
   type                 smallint comment '0:私有 1:同级共享 2:完全共享',
   PRIMARY KEY (org_id,folder_id)
);