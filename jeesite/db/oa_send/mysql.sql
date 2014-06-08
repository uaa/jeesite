/*==============================================================*/
/* Table: oa_send                                               */
/*==============================================================*/
create table oa_send
(
   id                   int auto_increment,
   org_id               varchar(64),
   user_id              varchar(64),
   type                 int,
   apply_time           date,
   secret               smallint,
   urgent               smallint,
   file_no              varchar(20),
   title                varchar(100),
   caption              varchar(100),
   keywords             varchar(200),
   print_org_id         varchar(64),
   copies               smallint,
   status               smallint,
   supervisor           bool,
   expire_time          date comment '为督办设计',
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: oa_send_receiver                                      */
/*==============================================================*/
create table oa_send_receiver
(
   send_id              int,
   org_id               varchar(64) comment '在部门设计表中增加一个字段，代表是否为系统外部门，只用于发文或会议纪要。',
   status               smallint,
   receive_time         date,
   type                 smallint comment '1:主送  2:抄送',
   PRIMARY KEY (send_id,org_id)
);

/*==============================================================*/
/* Table: oa_send_file                                          */
/*==============================================================*/
create table oa_send_file
(
   send_id              int,
   file_id              int,
   type                 smallint comment '1:正文(有且仅有一个) 2:附件',
   status               smallint comment '0:删除 1:可用',
   PRIMARY KEY (send_id,file_id)
);

/*==============================================================*/
/* Table: oa_red_template                                       */
/*==============================================================*/
/*create table oa_red_template;*/