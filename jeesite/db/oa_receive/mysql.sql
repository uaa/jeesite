
/*==============================================================*/
/* Table: oa_receive                                            */
/*==============================================================*/
create table oa_receive
(
   id                   int auto_increment,
   org_id               varchar(64),
   user_id              varchar(64),
   type                 int,
   receive_time         date,
   secret               smallint,
   urgent               smallint,
   file_no              varchar(20),
   sourc_file_no        varchar(20),
   title                varchar(100),
   caption              varchar(100),
   keywords             varchar(200),
   send_org_id          varchar(64),
   status               smallint,
   supervisor           bool,
   expire_time          date comment '为督办设计',
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: oa_receive_file                                       */
/*==============================================================*/
create table oa_receive_file
(
   receive_id           int,
   file_id              int,
   type                 smallint comment '1:正文(有且仅有一个) 2:附件',
   PRIMARY KEY (receive_id,file_id)
);
