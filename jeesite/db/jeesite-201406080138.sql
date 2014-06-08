-- MySQL dump 10.13  Distrib 5.5.5-m3, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: jeesite
-- ------------------------------------------------------
-- Server version	5.5.5-m3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('39e78f793e814eaf9e9351685b9c9ebc',1,'leave.bpmn20.xml','5e5fa84b75a3424f84b23622a3975db8','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"com.thinkgem.jeesite.modules.oa.leave\">\n  <process id=\"leave\" name=\"è¯·å‡æµç¨‹\" isExecutable=\"true\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"oa:leave:deptLeaderAudit\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\"></userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"oa:leave:hrAudit\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7e1c156b73d24e1ab71e59f75bb227eb',1,'leave.png','5e5fa84b75a3424f84b23622a3975db8','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ï\0\0b\0\0\0_\'r“\0\07˜IDATxœíİŒ¤õ}ğÅX[F\\•Ôœ+&é¬âÚ·ª#q•ÃQ}[©µWªe¶şã¼’eû¬¤ªªdİ\n_Õ˜ªÆ½¤6\"­MV­h·Š¯ì^bp66+`8g¯3‹gmÀ^Ê÷ƒ›>·cO†ùùÌîwæ;Ï÷y½ôÕinwæÙg¾Ïçy¾Ÿ÷ÍŞÌD\r\0\0\0B›ˆ½\0\0\0$HÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤Í>ªÕêÒÒÒÜÜÜ={*•ÊDYeÏ=›ÙÙÙÅÅÅØ‡…1â©s‹º­S·\0•´ÙË‘#G²•8kGn¿ıö»î¾ûÉ\'Îœ=[Î‘=÷l>¼oß¾lN²¾$öÁa,8Gœ#E¤nÕ-\0£!mv¶±±1??¿wïŞg}æÌÙ3Fóxş…ç³¾$›œõõõØŠhœ#Î‘\"R·ê€Q’6;ÈÚ‘ééé/ßö¥3gOİÆ_½óÚk¯][[‹}¸ˆÀ9â)\"u«n1i³ƒùùùÍvä5£÷¸ëî¯_wİ?Š}¸ˆÀ9â)\"u«n1i³Õ‘#Göî}ÿÙsU#Ïøİßû×7ßüû±\Z#åq‘ºU·\0Œ´ùÕjµR©<ûÜÚÙs¯\ZyÆÉS?Ûµë=«««±#âq‘ºU·\0D!m¾ÁâââüüüÙs¯4Æõ3ÿ4çûÈ7?ªTãæ›ÿıÂÂBìCÇˆ8Gœ#E¤nÕ-\0QH›o0;;{øÿı·íÈû÷şM­öôëµ\'ÎÖ¾{ºöÈéÚƒ\'ÏºãñÜK÷Ÿ©ıßjíşjíWj_­öG÷<ú‰ıŸŒŞDß~èèôôtìC7\\õ÷±ôat5çHŠçHÊ[İ¦W·\0‚´ùSSSÇ?|öÜ©ú˜˜˜8Y«:_{é\\í§gj¯Ôjÿêß|vâMoÛışÙçÎÖ9]{æµÚZµöä¹ÚŸşõ#›ÿ~ª„ãä©\'\'\'cº!Êºğë®»îË·İ¶gÏ´;ò<œ#‰#%)ou›XİPÒfµZ]^^>pàÀììì_˜™™É¾²´´T¬öeÇ/¼øÜÙs\'ë#k2^y½vúõß:wşÂŸöµ?ÿ{ÿüÛÏıÁ¹Zíåsµ—ÎÖ~z¶–=Ã¯?ğÍäd9GöÜã¸á©÷â~û¡3gÏe¦İ‘çáIé)Oy«Û”ê€ÙÖB’…Ì,UNNNf93Ë–‡ßq×İß¨;¿úµ›núìÜÜ\\¶ÆïŞ½{qq1Ğ×fWñrcd=u®öâ«µ3¯ÿüY+öŸ¿ğÇ¿ÿŸ¾ğÌ.|øõÙóµ3›Ê}ß~¤å±¥\Z©v$Í½x}ŒIGqÂ#Éœ#ãSŞ#˜u›LİP,[\\H;–5%YÈÌRe£Sé6î¹÷¾}û>:==½²²tçÃÛì*ş_c\\èH^¯=ÿJíÇ\'kgkµ3§OO]sÍÄÄÅ“úûšøàC·<¶T#É¤½^GŞûMJúŞ\'àäÙUçHçÈPË{ëYİ¦Q·\0ÎV’ƒfÑñ®»¿Ñ7g¶41Ys³ÿşjµ\Züi„²ÙU¼Ô›¿mõâ«µ½\\ûÉkµÿàÊ+¯¼øÍ—¾åŠ_ûÈ:’¾ıPËcK5ÒëHºõâC\nœ=&°å[Í2íÎ‘Î‘a—÷Ö³ºM n(¢Á’,(ÎÍÍ-,,”3›Ço¹%ëcÖ××‡ô|¶i³«ØhŒì¯¯¯ı´záß¿Ÿ­v÷«ïŞõŞ_ş»o¿bÇßùãÿş§¯Õj\'O×^9}á÷} å±¥\Z‰u$½{ñaÎúv|‘§Û·FğrP·]uúAya=«Û¢×-\05ÀB’EÍİ»w/--m9j6~±6ÛÎÚÚÚĞÔÖe+ë¹s?kŒúB›5%/­ıìLíG/Ÿ½ïÑµ]ÿğ7®ÿÇÿä\'§k?®Ö~R­½xº–õ$÷Üÿ@ËcK5RêHòôâÁgÎ×‚Úï6ú™wúMya=«ÛB×-\0Å5ÀB277·ı¨Ùèc²À9†¿RÛÒUì¹şºï|ï‰]=zlõŞ‡Vï}øñû¾sâ/ïÿî_?úÔ7zü[}ÿŞ‡¿ô‘Ç}â‡·ü×Û>|Ã‡£w:’mÊß‹‡\rœ}_jÜ-â«š}pôYya=«ÛâÖ-\0…–w!9xğàv~¶}>|ÇìììPŸÛlv$?m¿õ[ŸìúË^Mşù‡>ÔòÀR4:’A{ñ€³½ïøÅQ¾Ôs¤ çÈ(Ë{ëYİ´n(º\\É±cÇ¦§§FÍúøÄ\'>yë­·ûd³#yÑt$Ğ‘l­8ówçí¶üC·¼«Ñë­ˆ#î92âòÃzV·E¬[\0k!É¢æÖÚ”Şã™gŸ»úêÊXı>í…äõŒAGÑ;’ö^üÎ¯~íšk¦<q¢cé>ÿÂ‹»víúòm·…\nœF¼½óî8·\'Ü9R¸sdôå=†õ¬nW·\0¤¡ÿB²¼¼<;;<jÖÇ§?ı;‡\ZÁóÌi³#yŞtº#éØ‹ONNfOêê«+íy½¯wÏ¡g	l|«¥Yo¿1\ZÎ‘b#QÊ{ëYİ«nHFÿ…$ë0ıhÍ^ŞÜ¹sçgN›ÉOŒAGq;’½x]KGŞÜ‹œ[èÎ{|q¨œ#:Gb•÷Ö³º-Pİ’>IÖXìØ±cHQ³>®½öÚ£GæÙöµÙ‘üØt´#iïÅ_>yjçÎ-¿ş×èÈÛ{ñLÖ»?óìsÛœİ~½°ãï¶ì@·‡‰s¤(çHÄòÃzV·E©[\0Óg!Y\\\\œŸŸjÚüÜÍ7/,,ŒæÙÖ---uû´ÏÍdİtŒ[GÒã7t{ß”ì+;vìhïÈzøá½ø_ıZûB}g,Î‘q>G”w7êvœë€rê³ìß¿ÿÖ[ojÚ¼ëîod½ËhmæñÇ¯7R—_~ùáÃ‡[¾«#I #é}ˆëz¿EgÇüÒK/ÍÓ‹GŞ—sdœÏåİºçº ´ú,$333İ\ZPãÉ\'®¾º2šg›©V«ozÓ›êMÉ%—\\ò®w½«ùßÂ7;’¿1cÕ‘ô>Äµ|ŸÑ±#ÏÙ‹sG‡sdœÏåİºçº ´ú,$Cúì“æñòÉSYg3šg[×ò?—Şò–·|ìc«Kö××_ÿ‘1è·¤Ç!ÎÿÁƒ=:ò¾½øØvä99GÆùQŞİ¨Ûq®[\0Ê©ÏB’-ŞÍo1¤‘­gY×ÒãÚGéõ×Ÿ3ãt{Ëzñüï±ü—+uñÅ·lá¢‹.ºí¶?É¹…ú/ŠerrŠ^oE#9G”wÑk ˆcBÚ`{ú,$SSS?>‚´9šg[wÅW4úÙMY·´ººZûù¿?k:Æ­#éqˆ;–uäÏ¿ğbß²ìøu?¨°ã²Ÿ›ıÄØó10çÈ8Ÿ#Ê»u;Îu@9õYH†úa›õ1âÿ·¹±±QïE² ıñ<ûsii©ñİÍä™-ŒŞl|·Ë¿¸çÚH·‡·l$Ï^5ïOÎİwÇFvûê}ˆkù:ò½xÎ|{ñœ†t„:›¶Ÿàõ?ÊsDyw½nó×aÇ‰¸‡#¨[\0J«ÏB2??ßüéŞÃ÷Ü{ßµ×^;šg›yúé§\'\'\'gff*•ÊÂÂBË:Ú\\ï8ĞhK}?lùkãnİŞívûvún¤GûØq;}·œFvûê}ˆëzwä{ñ‹.º(G>†½x~ÁÏ‘-”Sß­cmÇªÿQ#Ê»›èuÛãĞ7ê³Gáõ(æX{°n(­>É¡C‡>ıéßjÚÌÒì¾}É“ı¹åååÅÅÅËd]¨…m¹sËCÚÿš³Î¹c¡ÚîqëHzâ†ny·Ï¸ÿ£ÿò…TØŞ‘g/>aŸ#9OŠj8bıøQŞİÄ­Û<ÅÜ|o/İ<«Àè÷ä‡€¤ôYH²e»R©5mîİ»÷È‘#£y¶}m®ëO4šR¿İøJûnoßHÇG\rº{ïßPÛÕŞ?(ö¡ÛŠö¼[/^‹ÎoãÙÒ‘s/ÄÖ*dûuÛR½Í¢×ÿx#Ê»Ùêv;Ş\\-ß»ç½¶0>ú/$C}£ —OÊú›ú;ÔƒëúùµAGıQÇ¶üµåvÇÇ¶ÜîĞOçŞNÇv¼y#İîÜ{û}g ö¡Û¢ö|ß¾vìÅë£½#ß»woVÆEïÅóÛr‘zBmí>QêlÏåİ0‚ºí]İŠ³ñõw²çë€”ô_H†úË´ğùÏgÁóÌis]*ÿèŞ×>Õ¼©›mùVã¯İŞí\'æy`ŸÒ¼…-ŒBw$=:ò<ØÜ‘\'Ó‹ç·:ÉYKİN™¾Å«şÇùQŞuÃ>¾}KºcU·|+âN[İŒşIµZ­T*ÃøÔÍ¬¹úêÊúúúgN›‹ı¶9\Zi¿ÑíÎm­óÚÿÌÿÓ»wäo¸OÎ=ÌùCcºméØ‘÷øŒûzGR/_s¤ïéÓ÷§´ÔsÜúósDy×†_·yjµGY¶,-wµçqë€4äZH–––>|Ã\rÉ¿°YûyGrb ÑÖ:œhl¤ıFÇ‡wüJûŸ9·Ğü×·û™ssNBìC·]íyÖs÷¨ŞÇO©Ïo›¥Ò·zvoëüÏå=‚CÜí¸·/\rË²GÅFÙóq¨[\0w!ùÀ?xøğ£fÖÍìÚµ+kh†úôµ¹®?9Ğh~Hıvã+í7z?¼ı!-öë¶Ÿì}·n?¥÷æœ„Ø‡.€<TØ>ÒèÅóÛf©z6\rzÏ(õ_ˆs¤äå=‚CÜ·V{_·›ï0ââçº èò.$×^{m¨·ª¿5â“\'Nõ¹mÁæºşÄ@£ù!õÛMC‡ût{xã±İ6ó+İ~nÇÛÍ;ÜwW{OBìCÆ y2½x~[«AO¥nµİ=IÆ¬ÿ¢œ#e.ïáÙü…İ£Â»]ÿ#îöøÔ-\0…6ÀB²ººšÎnŸ÷=PÔüÀ?xçW¿6¼gµe[K›-]oˆØñ[sã@ñ2çÏmnqZ~JÉÓfm<¥^<¿!µ¿}k5ÿ95úú/Ğ9RÚò›6û^ÌÛïĞí!£ßùØ‡€bl!É:]»vİsï}[š?EÖñŒšµÍäüùÇ\ZÍ©ßnßHÇÍ6jÇ{¶o6çrşÜ?¥÷ÖzOBìCR<±^<¿­UHş“(ÏwsêÈê¿XçH9Ë{xG6¶_í[¾5Ğõd;ûĞPl/$Y§rÓMŸôÿÿ¼|òÔ|şóõ_ÇÆ3	bs]ÿ¾1èH¯#éİ‘§×‹ççIà)ay«Ûê€\"ÚÊBR­V³´yÍ5SYzl¼oaïñåÛnËîÿéOÿNÖÇmv$«Æ #É¤[Gd/Ÿs$s¤lå­nÓ¨[\0\ngëÉúúú7Ş¸cÇ|ğƒY˜l?ıì+·ßş??|Ã\rÙ}öíûèÚÚZ¸İ–Íä{Æ #Õ¤½#OµÏÏ9’Ì9RªòV·ÉÔ-\0Å²İ…¤Z­.//ÏÏÏïÚµkâ²¯dQsiiicc#È¾Àäää«¯>|şüwFÂIsGp/Ÿs$¥s¤<å­nSª[\0\nÄBò•Jå©§şâüùãÆ@#í¤Ş‘?yâDÂ½x~Î‘ÄÎ‘’”·ºM¬n(\nÉÌÌÌüŸ#·¯=fäß[ı³©©©Ø‡n¸².<ëVîÅós¤w|àH¾¼Õmzu@!H›opğàÁ……E_ã‹5şdñsóóó±İĞ•á9æáIï)ÃëWê6½º Òo2²¶¶65õ«¯V<_{ÔÈ9fgß·¼¼ûĞ\r]:ò<œ#é#e¨mu›^İPé7ƒ:pÁşóµïyÆÿZúss3±Ú(”¡#ÏÉ9’Ø9R’ÚV·‰Õ-\0…PŠ&c ÕjuÏß8zôÔj½ÇúúİSS¿º±qOìƒ6\n%éÈóp$v”¤¶Õmbu@!”¢ÉÔêêêôô5««ËµÚ1£ÛÈÚ‘¬u[YùRìÃ5\"%éÈsr¤t”§¶ÕmJu@!”¥ÉÔÑ£G³¦äàÁY«=l´ååÏOMUVVş[ì5:åéÈsr$s”ª¶Õm2u@!”¨ÉTµZ]X˜ß³ç½‹‹ÿn}ıëµÚCÆÆÆ_--ı‡¹¹½³³{²Û±ÑH•ª#ÏÉ9’Æ9R¶ÚV·iÔ-\0…P®&cVVVæçÿÙÎ¿4ÁÄÄ—ÏÍ½?kJb–&JÖ‘ççiVÄsd¢”µ­n›±n(„26åsÏâš(eGN¨í¸\\ÛH˜&£î¿ÿş¬#ÜØØˆ½#å¥#\'Uj;.ó@Â,rÅpÕUWeÉoÿöoÇŞ‘òÒ’*µ—ù a¹øÃ?üÃú­yÇ;ŞqìØ±Ø»SR:BR¥¶ã2ÿ\0$Ì\"7î666&\'\'ëióÒK/}ï{ß{JJGHªÔv\\æ€„YäÆİììló;^uÕU‹‹‹±wªŒt„¤JmÇeşH˜En¬mll´¿Uı;ßùÎjµ\Z{×JGGHªÔv\\æ€„YäÆÚ—¾ô¥zÂ|÷»ßİH›¿şë¿¾²²{×JGGHªÔv\\æ€„YäÆÚ·¾õ­·½ím•JeÇYG²sÓÛßşvisôt„¤JmÇeşH˜EnÜ;vlmm­ö‹$»ími£Ğ’*µ—ù a¹ÂĞ‘ÄeşI•ÚËü0‹\\aèHâ2ÿ¤JmÇeşH˜E®0t$q™R¥¶ã2ÿ\0$Ì\"W:’¸Ì?©RÛq™\0f‘+I\\æŸT©í¸Ì?\0	³È†$.óOªÔv\\æ€„Yä\nCG—ù\'Uj;.ó@Â,r…¡#‰Ëü“*µ—ù a¹ÂĞ‘ÄeşI•ÚËü0‹\\aèHâ2ÿ¤JmÇeşH˜E®0t$q™R¥¶ã2ÿ\0$Ì\"W:’¸Ì?©RÛq™\0f‘+I\\æŸT©í¸Ì?\0	³È†$.óOªÔv\\æ€„Yä\nCGW”ùwĞe—ù a¹ÂĞ‘ÄÕ{ş\'úÉs·¾÷ú“¤””V\\æ€„Yä\nCG× óßñş=6Òò­æ¿:ô•‹Ëü0‹\\aèHâ\n˜6;¾hÙí[^ŞdØÔU\\æ€„Yä\nCG×@óßíÎ9_Ûl¿›£Ïğ¨®¸Ì?\0	³È†$®üóßòreûFz¼¶Ù¼¯j2\Zª+.ó@Â,r…¡#‰+çü·DÇÿ³ï½¶É(©®¸Ì?\0	³È†$®<óß1d¶ßÎ“6½¶ÉÈ¨®¸Ì?\0	³È†$®Şóß;æÉZS°ìı›´9(¡Ìâ2ÿ\0$Ì\"W:’¸Fö.Aİ~W0$J+.ó@Â,r…¡#‰+VÚìñEB]ÅeşH˜E®0t$q\r/mæ|gÚA÷rRWq™\0f‘+I\\æŸT©í¸Ì?\0	³È†$.óOªÔv\\æ€„Yä\nCG—ù\'Uj;.ó@Â,r…¡#‰Ëü“*µ—ù a¹ÂĞ‘ÄeşI•ÚËü0‹\\aèHâ2ÿ¤JmÇeşH˜E®0t$q™R¥¶ã2ÿ\0$Ì\"W:’¸Ì?©RÛq™\0f‘+I\\æŸT©í¸Ì?\0	³È†$.óOªÔv\\æ€„Yä\nCG2zKKKÙ´ONNNOOg7vîÜ™ıùÖ·¾uuu5ö®A0®-q™\0f‘+Éè}å+_™hsıõ×///ÇŞ5Æµ%.ó@Â,r…¡#½jµzÙe—5GÍ÷¼ç=;wîÜØØˆ½kŒkK\\æ€„Yä\nCGÅg>ó™7¿ùÍ´ù©O}jaa!öNAH®-q™\0f‘+I,W^ye=jŞpÃ\r•J¥Z­ÆŞ#Éµ%.ó@Â,r…¡#‰å›ßüæ%—\\’ÍÿÌÌŒÿ±Iz\\[â2ÿ\0$Ì\"W:’ˆŞ÷¾÷ÕÓfìğ\\[â2ÿ\0$Ì\"W:’ˆÖ××³ù÷Á\'$Éµ%.ó@Â,r…¡#‰Ëü“*µ—ù a¹Â(gGR­V—––æææöìÙS©TÚ?ı²$²çÍÀìììââ¢Ï_!¬‰R^[Æ‡ù a¹Â(aGräÈ‘,eeQóöÛo¿ëî»Ÿ<qâÌÙ³åÙsÏfàğáÃûöíËæ$Ëœ±é(áµe¬˜\0f‘+ŒRu$óóó{÷î}æÙgÎœ=c4ç_x>ËœÙä¬¯¯Ç>P¤ T×–1dşH˜E®0ÊÓ‘dQszzúË·}éÌÙÓF·qçWï¼öÚk×ÖÖb.\n¯<×–ñdşH˜E®0ÊÓ‘ÌÏÏoFÍ×ŒŞã®»¿~İuÿ(öá¢ğÊsmOæ€„Yä\n£$É‘#Göî}ÿÙsU#Ïøİßû×7ßüû±\ZÅV’kËØ2ÿ\0$Ì\"WeèHªÕj¥Ryö¹µ³ç^5òŒ“§~¶k×{|(ÛQ†kË83ÿ\0$Ì\"WeèHçççÏ{¥1®Ÿù§9?#¤ùQ¥\Z7ßüïb:\n¬×–qfşH˜E®0ÊĞ‘ÌÎÎ¾ãÿmÔ|ÿŞ¿©Õ~½öÄÙÚwO×9]{ğä¹Cw|ã/{éş3µÿ[­İ_­İóJíë¯ÕşèG?±ÿ“Ñƒ_”ñí‡NOOÇ>tX®-ãÌü0‹\\a”¡#™šš:~üá³çNÕGö”OÖj§Î×^:Wûé™Ú+µÚ¿ú7ŸxÓÛv¿ö¹³µgN×y­¶V­=y®ö§ıÈæË›§J8Nzqrr2ö¡£ÀÊpmgæ€„Yä\n£É;^xñ¹³çNÖGö”_y½vúõß:wşÂŸöµ?ÿ{ÿüÛÏıÁ¹Zíåsµ—ÎÖ~z¶¶Q«}ıïl¦Í“åe¨\r†GıÄeşH˜E®0ÊĞ‘l&Æ—#ûë©sµ_­yıçwØØØøÏ_øãßÿO_xæGëÙ_Ï¯ÙL¡÷}û‘–Ç–j”¡6õ—ù a¹Â(CG²™ÿ_c\\H›¯×¥öã“µ³µÚ™Ó§§®¹fbââ‰‰Éı‹}Í|ğ¡‡[[ªQ†Ú`xÔO\\æ€„Yä\n£Éfb|©1ê¿Iûâ«µ½\\ûÉkµÿàÊ+¯¼øÍ—¾åŠ_ûÈÒæß~¨å±¥\Ze¨\r†GıÄeşH˜E®0ÊĞ‘l&ÆÆÈşúêùÚO«^Û|şµÚİ¬¾{×{ùï¾ıŠçÿûŸ¾V«<]{åô…Şsô–Ç–j”¡6’õõõ;wÆŞ‹Rsş0‹\\a”¡#Éã¹s?kŒúSÎçKgk?;SûÑËgï{tm×?üëÿñ?ùÉéÚ«µŸTk/®eyóûhyl©Fjƒ!Y[[«T*±÷¢Ôœ¿\0$Ì\"WeèHZãë¯ûÎ÷xğÑÕ£ÇVï}hõŞ‡¿ï;\'şòşïşõ£O}ó¡Ç¿õĞ÷ï}øûGyüÑ\'~xË½íÃ7|8zê“6)œ#GÌÌÌÄŞ‹Rsş0‹\\a”¡#ÙL›?m¿õ[ŸœÈáŸèC-,Õ(Cm0$6ÅŞ‹Rsş0‹\\a”¡#ÙL›/\Zƒ2ÔC233säÈ‘Ø{QjÎ_\0f‘+Œ2t$Òæë/ƒ2ÔÃ°¾¾^©TªÕjì)5ç/\0	³ÈF:’Í´ù¼1è(Cm0‡ºñÆcïEÙ9H˜E®0ÊĞ‘l¦ÍŸƒ2ÔÁU«ÕJ¥²¾¾{GÊÎù@Â,r…Q†d3mşØt”¡6n~~~qq1ö^PŠk;\0¥e‘+Œ2t$›isİtt«¥¥¥µµµÑCŠáĞ¡Cû÷ï½\\P†k;\0¥e‘+Œ2t$Òf´¹±±ñ‘|¤şÙ0ïxÇ;NšU«ÕùùyQs|”áÚ@iYä\n£ÉfÚücĞÑ\\·Şzëääd=jf7vîÜé?æQ·±±qèĞ¡J¥âhÇJ®í\0”–E®0ÊĞ‘dÏñõ×d:êµ±ººúk¿ökMvïŞE‹ØG•ÈVVV<8;;›Ã7Şè_ÆM®í\0”–E®0ÊĞ‘l¦ÍçŒAG6o{öì™€N²ÚXXXX^^ŞØØˆ}ŠÓÁD	®í\0”–E®0ÊĞ‘L\\H›Ï\Zƒzm¬­­ıæoşæ¯üÊ¯4bÆå—_>==û¨Y.…æ\00‹\\a”¡#ÙL›Ï„ÍÛìøÊO;çÜl/ãuü¹9<räÈÕW_ıÎw¾³şì.»ì²jµ\Zñ˜’_ßW)óÜ­ï}â=?:sP\0H˜E®0ÊĞ‘lf³Í¶o¿ş•Nô‡-í¶Íœì¶PO°y\Z³xyàÀ«®ºjzz:ûóØ±c±(ÛÔñ¬ïq)hùVó_Ëp)(‡€„Yä\n£ÉğòX·ØÙr£9+¶§Ê¯õı‰Ã~^í“¹¶¶¶¸¸¸¼¼<úãH(=ÒfÇ-»}«ıŒG€„Yä\n£Éf6{zx£¾ı¦ˆøtã\'¶¥Ç§[îóvóÛ·9¼çûĞ^·ÃÚãpOô|1SŒ\'Ç€„Yä\n£É…Hv~-ìøyÒûÅín7\Z÷lùJË¦zßnyxû†4ÊPeÓòreË·j=_ÛlŞBû}7\0	³ÈF:’ÍlöTğÑØlÇş»ù>İşìñğæ4?ª÷İ‚?ÁØ‡Z¢cËñí˜B;¦Í›eÜ8.\0$Ì\"WeèH6óØ‚ÆfÛ·_ÿJûšïÙû‹yîÜñG‡}‚±Át™í·ó¤ÍvCİs¶Æq a¹Â(CG²ÉNÍÖo4½ÒØú•î¯I¾a;ynwÛÈ`ìCG\0-°c¬5Ëö$Ù±”Ç˜s€\0H˜E®0ÊĞ‘lF²\'ƒÆfë7Úÿìvÿö¯w£Vßm†z‚±áu;¬=w{\"íøuÆŠƒ@Â,r…Q†d3’=|ü\">Ñø³å+»5ß¿ùn-wÈs»S\"\rÿÔ\Z?+ö¡#¼€i³Ç‰Î a¹Â(CG2¼´Ù{ÅüÛìlûŞ_Ú¤›Òfã5ZîĞòO=6K,\0	³ÈF:’ì9?ÿøFËÆıwóínún­ıëÍwè¶‘€O-ö¡¶Èù@Â,r…Q†d3’}ßt”¡6 UÎ_\0f‘+Œ2t$›isÕt”¡6 UÎ_\0f‘+Œ2t$›ió{Æ £µ©rş0‹\\a”¡#™œœ|õÕ‡ÏŸÿ®1Ğ(Cm@ªœ¿\0$Ì\"WeèH*•ÊSOıÅùóÇFjRåü a¹Â(CG233óÜz¾ö˜‘|oõÏ¦¦¦b:`‹Êpm ´,r…Q†äàÁƒ‹ßŠ5şdñsóóó±°Ee¸¶PZ¹Â(CG²¶¶65õ«¯V<_{ÔÈ9fgß·¼¼ûĞ[T†k;\0¥e‘+Œ’t$.Ø¾ö#Ïø_Kÿqnn&öA¶®$×v\0ÊÉ\"W%éHªÕê=¿qôèÿ¨Õ1zõõ»§¦~ucãØ\rØº’\\Û(\'‹\\a”§#Y]]¾fuu¹V;ftYÔÌbùÊÊ—b.`[Êsm „,r…QªäèÑ£Yà<xğ_ÖjícyùóSS•••ÿû@ÛUªk;\0ec‘+Œ²u$Õjuaa~Ï÷..ş»õõ¯×jµ´ôææöÎÎîÉnÇ>D@\0e»¶P*¹Â(gG²²²2?ÿÏvîü¥	&&vì¸|nîıYàŒ}X€`&Jym $,r…¡#‰ËgZÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…¡#‰ËüÃàÚ@Â,r…1hG2Ñ$Ï¦¶óÅT»¥¥¥¥ì©MNNNOOg7vîÜ™ıùÖ·¾uuu5ö®‰Hõú	\05i³@úv$o”ó>}ïßãë]ğ¬ÆÛW¾ò•ögwıõ×///ÇŞ5 )]3 …E®0êHòß¹ã•ƒÆÈT»¥jµzÙe—5ÏÀ{Şó;wnllÄŞ5 ÀüŞ\0%‘fHHRïD×#\"6Åæ4^Ÿìñƒºİîñsfcí3ŸùÌ›ßüæÆ³ûÔ§>µ°°{§€bó{\0”DjÙ a}ƒ\\Î”Ø2ó$Ò–Ûí©2½ÙìÊ+¯¬?ån¸¡R©T«ÕØ{›ß›\0 $R	‰É“6û¾°ÙşõöW8ûn§ùQ½ï–†o~ó›—\\rIö¼fff¼ò\0á÷&\0(ƒÔ‚AÂò¤Í¾·»}7Ïc;Ş.É‹œï{ßûêi3ö\0éğ{\0$/Íl¤í¿¶Ù~ŸZˆ´™ö›uëëëÙSó@@~o€ä¥™\r’4Pë}ç¾¯mæI­Pªi³–ôSbñ{\0¤M]¡^ÛìñgûòÚfİÆÆÆüü¼7ğ\0Âò{\0¤-Íl¤í¿¶Ùş‚d·—(ûşĞ–_ÄİÚNE2¯»îº/ßvÛ={N ¬$/›\0Pg‘+Œ¾¿Û[Ë=kİ_·ÌóC;ÆÔ$_Û¬GÍ¿ıĞ™³ç²?N`›ªÕêòòòfgg÷üÂÌÌLö•ÅÅÅõõõØ;\0Á¤–\r699éG¬9jÖ‡À	lY2³„Ù÷§§§o½õV|\0 mF¥RY[[‹½%Ò5N`kVVVvïŞİ7g6Ë®ùŞ¨€¢“6czzúØ±c±÷¢,ºEMHµZŸŸoõòw÷÷¾ã®»¿Ñ7İôÙ½{÷¶ÜsvvÖ¥€â’6#‹7+++±÷¢zGMÈi}}½å%ÍOúw<q¢Çµåù^üâ-·ìÜ¹³ùENÿÔ@AI›…1??¿¸¸{/Ò—\'j\nœ@_kkkYPl„Æ™™™Ş9³%sŞtÓgœœ<zôhì\'\0“6#‹šYàŒ½‰Ë5N ‡jµÚüªæçn¾9çU¥yÜ~ûÿÌrfãNoW@áH›…±ºº:55{/R6hÔ8næææ\ZQóğá;¶5W˜;vÔ·“]jb?-\0Œ´Y$Ş(hx¶5N İòòò6_Õlw~õk­:t(ö“€H›E’õ7Şxcì½HP{ÔÌÚ»k®™êöŸ¬áÅ]»v}ù¶ÛN İôôtãÿjn3jÖGãÿpîÜ¹ÓçpP Òf‘dM†ÿº\\Ç¨Yÿ¿RW_]iœõ¨YïüN ÅÒÒRã­}yö¹ ióå“§\ZïRëß(i³`VVVü×€zDÍº–ÀÙ5N ]vh|ØI¨YÙ¥¦¾Ù;vÄ~Š\0—´Y<ğoÛA´GÍæÚg{ÔlùBà„2ËÎıÆÅ!Ô›‘]‹ê[öÙË\0…´YH333\"Ívt{[ æw€lœ=üpÇ¨yçW¿Ö¾¶´´´¶¶Öñ[‹‹‹õ‹Cv5³ñ‰O|²¾ñl	í3€-’6‹êÈ‘#•JåÀşçô~ÚóÒK/Í5NHÛã?^¿\\~ùå‡nùîşıûëßİş[Ñ¶»îşF}ã»wïòÜ`PÒfea&K›Yæœ™™Énøİªœò|ØIÇÀ™3j\nœ°jµú¦7½©~¸ä’KŞõ®w5¿Î™]ëßê}}ØÚxòÄ‰úÆ³Ë~¼	\0€H›…—µ>GÉÒfã­)è!ÿçjöœ}£¦À		kùßİoyË[>ö±Õ?˜¤ñÙ\'[ûğŞ¾£ñCcÏ\0äbÅ¢\\²¨y×İßÈÙØıåÊ_]|ñÅ-Qó¢‹.ºí¶?Éÿ›o{6…LÌÀ¸jÑnŸÖ»ÍÑØ~ìK)\0äbÅ¢\\;–Îç_x±oW×ñhë:~gÇ-d93û‰±Ÿ4cª%3ô9F»Õ¿ÕRÌùö”7¸âŠ+\Z8»);ÓWWW³oMMMÕ¿şØñãÃH›ÏgŠ=\0‹‹ÒÉ8{DÍœSÔ¤¯Şi³ïËhíé½öï\n-[ĞøŒ“,X~üãÏş\\ZZj|·ñ‹ù‡\"ÿÈ®*õûÈM\0ŠB«Aõœ£æE]”?pŠšôÕÿ:&Én÷ïøõ‰´ıÇõİ&=<ıôÓ“““333•Jeaa¡å?fÏÏÏ×gş‹·Ü<m>vüx}ãÓÓÓ±>\0D«AIuœ£fÖ\\şÑùBÇÏálœ¢&}åÌ~İ2dïäÙ÷\'öİ½-///..vüÈÍƒÖ\'vß¾O›Ÿ»ùæúÆçææFş¤`+´\Z”W{àì5ëï@Ûñ]j[§¨IÃ^Ç´Ù÷v·/vŒ—ÛÜmúZ]]­Ouv­xùä©°i3»^Õ7eİØO\0rÑ|Pjísß¾vŒšõÑ8÷îİÛè)EMÒ÷õÆ¾·»m¡Ç¦ºİP*•J}n¾#`Ôl|ØæÄæ\'9Å~–\0‹Vƒ²ë8;~®fsà5Ù²<I¯[†ì–B»ıˆÅ6-,,Ôg{×®]_ŞüÀ?Xßìììlì§\0yi8 sàì5›§¨É–µäÆ¾¯7æy)²±©Z§ßªmùº´9<OÅüÜÍ7‰š÷Ü{_£\\g\0(\r\\Ğ8³HÙ£ù{ìøqQ“Pz¿êØ#Fæ¹[{ÎìlÙ¾C‡5~?bû…òä‰øºÿşØO\0 Õ€ŸËó9œíCÔdËÚ_r¬uzY²Û_ï9»ı•àvïŞ]?¾YPìıÙ¼½ÇË\'O5Şº,ÛÔúúzìg\0ĞpÀß\Z4pŠšlMûÿ¢l½±ı>íï–E¥ÍèÖÖÖ\ZÿÁ;K‰½W¢ÛxæÙç\ZQsrrree%öÓ€Áh8à\ròNQ“Pzÿ&mï¯w{xÇ°:ÑÉ6wn²pØ˜ä,+~ñ–[ı¿š_ Í:t(ö€é3 UÀ)j}-//7fÒ®]»º½÷XËKš¾á†æ5((i:è8EM §ÕÕÕ©©©æè˜eÎ›núìcÇ·‡Ì/ŞrËŞ½{›ïœ…U¿@@qI›ĞY·À)jÙØØ8pàÀäädÇßd¾öÚk»}knnÎÛPhÒ&tÕ8EM`k²Ü8??ß1U¶Ë®3G½Ë\0°]Ò&ôÒ8EM`›ªÕêÒÒR;§§§[f¥R™½õÖ[½	@2¤Mè£8Ÿ<qBÔ\0€ü¤Mè/™•JEÔ\0€ü¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0OÚ\0\0 <i\0\0€ğ¤M\0\0\0Â“6\0\0ïÿ lJH	\0\0\0\0IEND®B`‚',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','1',1),('schema.history','create(5.13) upgrade(5.13->5.14)',2),('schema.version','5.14',2);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('5e5fa84b75a3424f84b23622a3975db8','SpringAutoDeployment',NULL,'2014-05-28 07:10:04');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('leave:1:96ea1878c3ed4e3ab9ea4338ddceca04',1,'com.thinkgem.jeesite.modules.oa.leave','è¯·å‡æµç¨‹','leave',1,'5e5fa84b75a3424f84b23622a3975db8','leave.bpmn20.xml','leave.png','è¯·å‡æµç¨‹æ¼”ç¤º',0,1);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'æ ‡é¢˜',
  `link` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« é“¾æ¥',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« å›¾ç‰‡',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ã€æ‘˜è¦',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `hits` int(11) DEFAULT '0' COMMENT 'ç‚¹å‡»æ•°',
  `posid` varchar(10) DEFAULT NULL COMMENT 'æ¨èä½ï¼Œå¤šé€‰',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`),
  KEY `cms_article_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES ('1','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'red',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'blue',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `content` text COMMENT 'æ–‡ç« å†…å®¹',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« æ¥æº',
  `relation` varchar(255) DEFAULT NULL COMMENT 'ç›¸å…³æ–‡ç« ',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  PRIMARY KEY (`id`),
  KEY `cms_article_data_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¯¦è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
INSERT INTO `cms_article_data` VALUES ('1','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('10','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('11','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('12','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('13','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('14','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('15','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('16','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('17','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('18','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('19','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('2','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('20','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('21','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('22','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('23','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('24','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('25','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('26','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('27','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('28','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('29','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('3','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('30','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('31','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('32','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('33','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('34','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('35','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('36','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('37','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('38','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('39','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('4','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('40','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('41','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('42','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('43','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('44','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('45','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('46','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('47','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('48','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('49','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('5','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('50','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('51','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('52','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('53','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('6','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('7','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('8','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('9','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1');
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `site_id` varchar(64) DEFAULT '1' COMMENT 'ç«™ç‚¹ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `module` varchar(20) DEFAULT NULL COMMENT 'æ ç›®æ¨¡å—',
  `name` varchar(100) NOT NULL COMMENT 'æ ç›®åç§°',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `sort` int(11) DEFAULT '30' COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `in_menu` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨å¯¼èˆªä¸­æ˜¾ç¤º',
  `in_list` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨åˆ†ç±»é¡µä¸­æ˜¾ç¤ºåˆ—è¡¨',
  `show_modes` char(1) DEFAULT '0' COMMENT 'å±•ç°æ–¹å¼',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  `is_audit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦å®¡æ ¸',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰åˆ—è¡¨è§†å›¾',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_parent_ids` (`parent_ids`(255)),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`),
  KEY `cms_category_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ç›®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES ('1','0','1','0','0,',NULL,'é¡¶çº§æ ç›®',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('10','1','4','1','0,1,','article','è½¯ä»¶ä»‹ç»',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('11','1','4','10','0,1,10,','article','ç½‘ç»œå·¥å…·',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('12','1','4','10','0,1,10,','article','æµè§ˆå·¥å…·',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('13','1','4','10','0,1,10,','article','æµè§ˆè¾…åŠ©',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('14','1','4','10','0,1,10,','article','ç½‘ç»œä¼˜åŒ–',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('15','1','4','10','0,1,10,','article','é‚®ä»¶å¤„ç†',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('16','1','4','10','0,1,10,','article','ä¸‹è½½å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('17','1','4','10','0,1,10,','article','æœç´¢å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('18','1','5','1','0,1,','link','å‹æƒ…é“¾æ¥',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('19','1','5','18','0,1,18,','link','å¸¸ç”¨ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('2','1','3','1','0,1,','article','ç»„ç»‡æœºæ„',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('20','1','5','18','0,1,18,','link','é—¨æˆ·ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('21','1','5','18','0,1,18,','link','è´­ç‰©ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('22','1','5','18','0,1,18,','link','äº¤å‹ç¤¾åŒº',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('23','1','5','18','0,1,18,','link','éŸ³ä¹è§†é¢‘',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('24','1','6','1','0,1,',NULL,'ç™¾åº¦ä¸€ä¸‹',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('25','1','6','1','0,1,',NULL,'å…¨æ–‡æ£€ç´¢',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('26','2','6','1','0,1,','article','æµ‹è¯•æ ç›®',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('27','1','6','1','0,1,',NULL,'å…¬å…±ç•™è¨€',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('3','1','3','2','0,1,2,','article','ç½‘ç«™ç®€ä»‹',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('4','1','3','2','0,1,2,','article','å†…éƒ¨æœºæ„',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('5','1','3','2','0,1,2,','article','åœ°æ–¹æœºæ„',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('6','1','3','1','0,1,','article','è´¨é‡æ£€éªŒ',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('7','1','3','6','0,1,6,','article','äº§å“è´¨é‡',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('8','1','3','6','0,1,6,','article','æŠ€æœ¯è´¨é‡',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL),('9','1','3','6','0,1,6,','article','å·¥ç¨‹è´¨é‡',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0',NULL);
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `content_id` varchar(64) NOT NULL COMMENT 'æ ç›®å†…å®¹çš„ç¼–å·',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å†…å®¹çš„æ ‡é¢˜',
  `content` varchar(255) DEFAULT NULL COMMENT 'è¯„è®ºå†…å®¹',
  `name` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºå§“å',
  `ip` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºIP',
  `create_date` datetime NOT NULL COMMENT 'è¯„è®ºæ—¶é—´',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¶é—´',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`),
  KEY `cms_comment_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯„è®ºè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_guestbook`
--

DROP TABLE IF EXISTS `cms_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) NOT NULL COMMENT 'ç•™è¨€åˆ†ç±»',
  `content` varchar(255) NOT NULL COMMENT 'ç•™è¨€å†…å®¹',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(100) NOT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(100) NOT NULL COMMENT 'ç”µè¯',
  `workunit` varchar(100) NOT NULL COMMENT 'å•ä½',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT 'ç•™è¨€æ—¶é—´',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT 'å›å¤äºº',
  `re_date` datetime DEFAULT NULL COMMENT 'å›å¤æ—¶é—´',
  `re_content` varchar(100) DEFAULT NULL COMMENT 'å›å¤å†…å®¹',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`),
  KEY `cms_site_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç•™è¨€æ¿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_guestbook`
--

LOCK TABLES `cms_guestbook` WRITE;
/*!40000 ALTER TABLE `cms_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_link`
--

DROP TABLE IF EXISTS `cms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'é“¾æ¥åç§°',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥åœ°å€',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`),
  KEY `cms_link_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å‹æƒ…é“¾æ¥';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

LOCK TABLES `cms_link` WRITE;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
INSERT INTO `cms_link` VALUES ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58åŒåŸ',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','è§†é¢‘å¤§å…¨',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','å‡¤å‡°ç½‘',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','ç™¾åº¦ä¸€ä¸‹',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','è°·æ­Œæœç´¢',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','æ–°æµªç½‘',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','è…¾è®¯ç½‘',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','æ·˜å®ç½‘',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','æ–°åç½‘',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','èµ¶é›†ç½‘',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site`
--

DROP TABLE IF EXISTS `cms_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹åç§°',
  `title` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹æ ‡é¢˜',
  `logo` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹åŸŸå',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `theme` varchar(255) DEFAULT 'default' COMMENT 'ä¸»é¢˜',
  `copyright` text COMMENT 'ç‰ˆæƒä¿¡æ¯',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰ç«™ç‚¹é¦–é¡µè§†å›¾',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`),
  KEY `cms_site_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç«™ç‚¹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site`
--

LOCK TABLES `cms_site` WRITE;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` VALUES ('1','é»˜è®¤ç«™ç‚¹','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','å­ç«™ç‚¹æµ‹è¯•','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leave_type` varchar(20) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `reason` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç†ç”±',
  `apply_time` datetime DEFAULT NULL COMMENT 'ç”³è¯·æ—¶é—´',
  `reality_start_time` datetime DEFAULT NULL COMMENT 'å®é™…å¼€å§‹æ—¶é—´',
  `reality_end_time` datetime DEFAULT NULL COMMENT 'å®é™…ç»“æŸæ—¶é—´',
  `process_status` varchar(50) DEFAULT NULL COMMENT 'æµç¨‹çŠ¶æ€',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`),
  KEY `oa_leave_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯·å‡æµç¨‹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prj_project`
--

DROP TABLE IF EXISTS `prj_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prj_project` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(255) DEFAULT NULL COMMENT 'åç§°',
  `root_package` varchar(255) DEFAULT NULL COMMENT 'åŒ…å',
  `erm_path` varchar(2000) DEFAULT NULL COMMENT 'æ•°æ®æ–‡ä»¶è·¯å¾„',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL COMMENT 'åˆ é™¤æ ‡å¿—',
  PRIMARY KEY (`id`),
  KEY `prj_project_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é¡¹ç›®';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prj_project`
--

LOCK TABLES `prj_project` WRITE;
/*!40000 ALTER TABLE `prj_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `prj_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `name` varchar(100) NOT NULL COMMENT 'åŒºåŸŸåç§°',
  `type` char(1) DEFAULT NULL COMMENT 'åŒºåŸŸç±»å‹',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_parent_ids` (`parent_ids`(255)),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('1','0','0,','100000','ä¸­å›½','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','8','0,1,2,','370532','å†åŸåŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','8','0,1,2,','370533','å†åŸåŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','8','0,1,2,','370534','å†ä¸‹åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','8','0,1,2,','370535','å¤©æ¡¥åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','8','0,1,2,','370536','æ§è«åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','110000','åŒ—äº¬å¸‚','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','110101','ä¸œåŸåŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','110102','è¥¿åŸåŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','110103','æœé˜³åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','2','0,1,2,','110104','ä¸°å°åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','2','0,1,2,','110105','æµ·æ·€åŒº','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','1','0,1,','370000','å±±ä¸œçœ','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','8','0,1,2,','370531','æµå—å¸‚','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `label` varchar(100) NOT NULL COMMENT 'æ ‡ç­¾å',
  `value` varchar(100) NOT NULL COMMENT 'æ•°æ®å€¼',
  `type` varchar(100) NOT NULL COMMENT 'ç±»å‹',
  `description` varchar(100) NOT NULL COMMENT 'æè¿°',
  `sort` int(11) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('1','æ­£å¸¸','0','del_flag','åˆ é™¤æ ‡è®°',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','é»„è‰²','yellow','color','é¢œè‰²å€¼',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','æ©™è‰²','orange','color','é¢œè‰²å€¼',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','é»˜è®¤ä¸»é¢˜','default','theme','ä¸»é¢˜æ–¹æ¡ˆ',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','å¤©è“ä¸»é¢˜','cerulean','theme','ä¸»é¢˜æ–¹æ¡ˆ',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','æ©™è‰²ä¸»é¢˜','readable','theme','ä¸»é¢˜æ–¹æ¡ˆ',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','çº¢è‰²ä¸»é¢˜','united','theme','ä¸»é¢˜æ–¹æ¡ˆ',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','Flatä¸»é¢˜','flat','theme','ä¸»é¢˜æ–¹æ¡ˆ',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','å›½å®¶','1','sys_area_type','åŒºåŸŸç±»å‹',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','çœä»½ã€ç›´è¾–å¸‚','2','sys_area_type','åŒºåŸŸç±»å‹',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','åœ°å¸‚','3','sys_area_type','åŒºåŸŸç±»å‹',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','åˆ é™¤','1','del_flag','åˆ é™¤æ ‡è®°',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','åŒºå¿','4','sys_area_type','åŒºåŸŸç±»å‹',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','å…¬å¸','1','sys_office_type','æœºæ„ç±»å‹',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','éƒ¨é—¨','2','sys_office_type','æœºæ„ç±»å‹',70,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','ä¸€çº§','1','sys_office_grade','æœºæ„ç­‰çº§',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','äºŒçº§','2','sys_office_grade','æœºæ„ç­‰çº§',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','ä¸‰çº§','3','sys_office_grade','æœºæ„ç­‰çº§',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','å››çº§','4','sys_office_grade','æœºæ„ç­‰çº§',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','æ‰€æœ‰æ•°æ®','1','sys_data_scope','æ•°æ®èŒƒå›´',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','2','sys_data_scope','æ•°æ®èŒƒå›´',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','æ‰€åœ¨å…¬å¸æ•°æ®','3','sys_data_scope','æ•°æ®èŒƒå›´',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','æ˜¾ç¤º','1','show_hide','æ˜¾ç¤º/éšè—',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','4','sys_data_scope','æ•°æ®èŒƒå›´',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','æ‰€åœ¨éƒ¨é—¨æ•°æ®','5','sys_data_scope','æ•°æ®èŒƒå›´',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','ä»…æœ¬äººæ•°æ®','8','sys_data_scope','æ•°æ®èŒƒå›´',90,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','æŒ‰æ˜ç»†è®¾ç½®','9','sys_data_scope','æ•°æ®èŒƒå›´',100,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','ç³»ç»Ÿç®¡ç†','1','sys_user_type','ç”¨æˆ·ç±»å‹',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','éƒ¨é—¨ç»ç†','2','sys_user_type','ç”¨æˆ·ç±»å‹',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','æ™®é€šç”¨æˆ·','3','sys_user_type','ç”¨æˆ·ç±»å‹',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','åŸºç¡€ä¸»é¢˜','basic','cms_theme','ç«™ç‚¹ä¸»é¢˜',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','è“è‰²ä¸»é¢˜','blue','cms_theme','ç«™ç‚¹ä¸»é¢˜',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('39','çº¢è‰²ä¸»é¢˜','red','cms_theme','ç«™ç‚¹ä¸»é¢˜',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','éšè—','0','show_hide','æ˜¾ç¤º/éšè—',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','æ–‡ç« æ¨¡å‹','article','cms_module','æ ç›®æ¨¡å‹',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','å›¾ç‰‡æ¨¡å‹','picture','cms_module','æ ç›®æ¨¡å‹',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('42','ä¸‹è½½æ¨¡å‹','download','cms_module','æ ç›®æ¨¡å‹',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43','é“¾æ¥æ¨¡å‹','link','cms_module','æ ç›®æ¨¡å‹',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','ä¸“é¢˜æ¨¡å‹','special','cms_module','æ ç›®æ¨¡å‹',50,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','é»˜è®¤å±•ç°æ–¹å¼','0','cms_show_modes','å±•ç°æ–¹å¼',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','é¦–æ ç›®å†…å®¹åˆ—è¡¨','1','cms_show_modes','å±•ç°æ–¹å¼',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','æ ç›®ç¬¬ä¸€æ¡å†…å®¹','2','cms_show_modes','å±•ç°æ–¹å¼',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','å‘å¸ƒ','0','cms_del_flag','å†…å®¹çŠ¶æ€',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','åˆ é™¤','1','cms_del_flag','å†…å®¹çŠ¶æ€',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','æ˜¯','1','yes_no','æ˜¯/å¦',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','å®¡æ ¸','2','cms_del_flag','å†…å®¹çŠ¶æ€',15,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','é¦–é¡µç„¦ç‚¹å›¾','1','cms_posid','æ¨èä½',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','æ ç›®é¡µæ–‡ç« æ¨è','2','cms_posid','æ¨èä½',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','å’¨è¯¢','1','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','å»ºè®®','2','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','æŠ•è¯‰','3','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','å…¶å®ƒ','4','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','å…¬ä¼‘','1','oa_leave_type','è¯·å‡ç±»å‹',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','ç—…å‡','2','oa_leave_type','è¯·å‡ç±»å‹',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','äº‹å‡','3','oa_leave_type','è¯·å‡ç±»å‹',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','å¦','0','yes_no','æ˜¯/å¦',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','è°ƒä¼‘','4','oa_leave_type','è¯·å‡ç±»å‹',40,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','å©šå‡','5','oa_leave_type','è¯·å‡ç±»å‹',60,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','æ¥å…¥æ—¥å¿—','1','sys_log_type','æ—¥å¿—ç±»å‹',30,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('63','å¼‚å¸¸æ—¥å¿—','2','sys_log_type','æ—¥å¿—ç±»å‹',40,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('64','å•è¡¨å¢åˆ æ”¹æŸ¥','single','prj_template_type','ä»£ç æ¨¡æ¿',10,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('65','æ‰€æœ‰entityå’Œdao','entityAndDao','prj_template_type','ä»£ç æ¨¡æ¿',20,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','çº¢è‰²','red','color','é¢œè‰²å€¼',10,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','ç»¿è‰²','green','color','é¢œè‰²å€¼',20,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','è“è‰²','blue','color','é¢œè‰²å€¼',30,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT '1' COMMENT 'æ—¥å¿—ç±»å‹',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ—¥å¿—è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `description` varchar(100) DEFAULT NULL COMMENT 'æè¿°',
  `sort` int(11) DEFAULT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_parent_ids` (`parent_ids`(255)),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¤šçº§å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_mdict`
--

LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'èœå•åç§°',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `icon` varchar(100) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `sort` int(11) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `is_show` char(1) NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤º',
  `is_activiti` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦åŒæ­¥å·¥ä½œæµ',
  `permission` varchar(200) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`(255)),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èœå•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('1','0','0,','é¡¶çº§èœå•',NULL,NULL,NULL,0,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','å­—å…¸ç®¡ç†','/sys/dict/',NULL,'th-list',60,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','æœºæ„ç”¨æˆ·',NULL,NULL,NULL,970,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','åŒºåŸŸç®¡ç†','/sys/area/',NULL,'th',50,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','æœºæ„ç®¡ç†','/sys/office/',NULL,'th-large',40,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','ç³»ç»Ÿè®¾ç½®',NULL,NULL,NULL,900,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','ç”¨æˆ·ç®¡ç†','/sys/user/',NULL,'user',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','å…³äºå¸®åŠ©',NULL,NULL,NULL,990,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','23','0,1,2,23','é¡¹ç›®é¦–é¡µ','http://jeesite.com','_blank',NULL,30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','é¡¹ç›®æ”¯æŒ','http://jeesite.com/donation.html','_blank',NULL,50,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','23','0,1,2,23','è®ºå›äº¤æµ','http://bbs.jeesite.com','_blank',NULL,80,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','æˆ‘çš„é¢æ¿',NULL,NULL,NULL,100,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','ä¸ªäººä¿¡æ¯',NULL,NULL,NULL,990,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','ä¸ªäººä¿¡æ¯',' /sys/user/demo',NULL,'user',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','ç³»ç»Ÿè®¾ç½®',NULL,NULL,NULL,980,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','ä¿®æ”¹å¯†ç ','/demo/demo',NULL,'lock',40,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','å†…å®¹ç®¡ç†',NULL,NULL,NULL,500,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','æ ç›®è®¾ç½®',NULL,NULL,NULL,990,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','æ ç›®ç®¡ç†','/cms/category/',NULL,'align-justify',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','ç«™ç‚¹è®¾ç½®','/cms/site/',NULL,'certificate',40,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','åˆ‡æ¢ç«™ç‚¹','/cms/site/select',NULL,'retweet',50,'1','0','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','0,1,2,3,','èœå•ç®¡ç†','/sys/menu/',NULL,'list-alt',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','å†…å®¹ç®¡ç†',NULL,NULL,NULL,500,'1','0','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','å†…å®¹å‘å¸ƒ','/cms/',NULL,'briefcase',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','æ–‡ç« æ¨¡å‹','/cms/article/',NULL,'file',40,'0','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','å®¡æ ¸',NULL,NULL,NULL,30,'0','0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','é“¾æ¥æ¨¡å‹','/cms/link/',NULL,'random',60,'0','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','46','0,1,31,40,41,46,','å®¡æ ¸',NULL,NULL,NULL,30,'0','0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','4','0,1,2,3,4,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','è¯„è®ºç®¡ç†','/cms/comment/?status=2',NULL,'comment',40,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','å®¡æ ¸',NULL,NULL,NULL,30,'0','0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','å…¬å…±ç•™è¨€','/cms/guestbook/?status=2',NULL,'glass',80,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','å®¡æ ¸',NULL,NULL,NULL,30,'0','0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','40','0,1,31,40,','æ–‡ä»¶ç®¡ç†','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,31,40,56,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,31,40,56,','ä¸Šä¼ ',NULL,NULL,NULL,30,'0','0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,31,40,56,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','ç»Ÿè®¡åˆ†æ',NULL,NULL,NULL,600,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡','/cms/stats/article',NULL,'tasks',30,'1','0','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','åœ¨çº¿åŠå…¬',NULL,NULL,NULL,200,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','62','0,1,62,','ä¸ªäººåŠå…¬',NULL,NULL,NULL,30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','è¯·å‡åŠç†','/oa/leave',NULL,'leaf',30,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','ä¿®æ”¹',NULL,NULL,NULL,40,'0','0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','æ—¥å¿—æŸ¥è¯¢',NULL,NULL,NULL,985,'1','0',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','æ—¥å¿—æŸ¥è¯¢','/sys/log',NULL,'pencil',30,'1','0','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','2','0,1,2,','æµç¨‹ç®¡ç†',NULL,NULL,NULL,983,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','3','0,1,2,3,','è§’è‰²ç®¡ç†','/sys/role/',NULL,'lock',50,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,2,69,','æµç¨‹ç®¡ç†','/sys/workflow/processList',NULL,'road',300,'1','0','sys:workflow:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','64','0,1,62,63,64,','éƒ¨é—¨é¢†å¯¼å®¡æ‰¹',NULL,NULL,NULL,50,'0','1','oa:leave:deptLeaderAudit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','64','0,1,62,63,64,','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,60,'0','1','oa:leave:hrAudit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('73','32','0,1,31,32','æ¨¡æ¿ç®¡ç†','/cms/template',NULL,'pencil',40,'1','0',NULL,'1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('74','73','0,1,31,32,73,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','cms:template:view','1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('75','73','0,1,31,32,73,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','cms:template:edit','1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('76','1','0,1,','é¡¹ç›®ç®¡ç†',NULL,NULL,NULL,1000,'1','0',NULL,'1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('77','76','0,1,76,','é¡¹ç›®æ•°æ®',NULL,NULL,NULL,30,'1','0',NULL,'1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('78','77','0,1,76,77,','é¡¹ç›®ç®¡ç†','/prj/project/',NULL,'globe',30,'1','0',NULL,'1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('79','78','0,1,76,77,78,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','prj:project:view','1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('8','7','0,1,2,3,7,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','78','0,1,76,77,78,','ä¿®æ”¹',NULL,NULL,NULL,40,'0','0','prj:project:edit','1','2013-12-12 08:00:00','1','2013-12-12 08:00:00',NULL,'0'),('9','7','0,1,2,3,7,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','1','0,1','é›¶ç¢æ–‡ä»¶','',NULL,NULL,1100,'1','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('91','90','0,1,90','ä¾¿ç¬º','/fragment/notepaper/pageMain',NULL,NULL,1200,'1','0','','1','2014-06-08 13:32:03','1','2014-06-08 13:32:07','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `area_id` varchar(64) NOT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `name` varchar(100) NOT NULL COMMENT 'æœºæ„åç§°',
  `type` char(1) NOT NULL COMMENT 'æœºæ„ç±»å‹',
  `grade` char(1) NOT NULL COMMENT 'æœºæ„ç­‰çº§',
  `address` varchar(255) DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_parent_ids` (`parent_ids`(255)),
  KEY `sys_office_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('1','0','0,','2','100000','åŒ—äº¬å¸‚æ€»å…¬å¸','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','7','0,1,7,','8','200003','å¸‚åœºéƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','7','0,1,7,','8','200004','æŠ€æœ¯éƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','7','0,1,7,','9','201000','æµå—å¸‚åˆ†å…¬å¸','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','12','0,1,7,12,','9','201001','å…¬å¸é¢†å¯¼','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','12','0,1,7,12,','9','201002','ç»¼åˆéƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','12','0,1,7,12,','9','201003','å¸‚åœºéƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','12','0,1,7,12,','9','201004','æŠ€æœ¯éƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','12','0,1,7,12,','11','201010','æµå—å¸‚å†åŸåŒºåˆ†å…¬å¸','1','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,7,12,17,','11','201011','å…¬å¸é¢†å¯¼','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,7,12,17,','11','201012','ç»¼åˆéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','2','100001','å…¬å¸é¢†å¯¼','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','17','0,1,7,12,17,','11','201013','å¸‚åœºéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','17','0,1,7,12,17,','11','201014','æŠ€æœ¯éƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','12','0,1,7,12,','12','201020','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸','1','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','22','0,1,7,12,22,','12','201021','å…¬å¸é¢†å¯¼','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','22','0,1,7,12,22,','12','201022','ç»¼åˆéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','22','0,1,7,12,22,','12','201023','å¸‚åœºéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','22','0,1,7,12,22,','12','201024','æŠ€æœ¯éƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','2','100002','äººåŠ›éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','2','100003','å¸‚åœºéƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','2','100004','æŠ€æœ¯éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','2','100005','ç ”å‘éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','1','0,1,','8','200000','å±±ä¸œçœåˆ†å…¬å¸','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','7','0,1,7,','8','200001','å…¬å¸é¢†å¯¼','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','7','0,1,7,','8','200002','ç»¼åˆéƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `data_scope` char(1) DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1','1','ç³»ç»Ÿç®¡ç†å‘˜','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','å…¬å¸ç®¡ç†å‘˜','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','æœ¬å…¬å¸ç®¡ç†å‘˜','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','éƒ¨é—¨ç®¡ç†å‘˜','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','æœ¬éƒ¨é—¨ç®¡ç†å‘˜','5','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','æ™®é€šç”¨æˆ·','8','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','7','å±±ä¸œçœç®¡ç†å‘˜','9','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` varchar(64) NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-èœå•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','8'),('1','9'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','8'),('2','9'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','8'),('3','9'),('4','1'),('4','10'),('4','11'),('4','12'),('4','13'),('4','14'),('4','15'),('4','16'),('4','17'),('4','18'),('4','19'),('4','2'),('4','20'),('4','21'),('4','22'),('4','23'),('4','24'),('4','25'),('4','26'),('4','27'),('4','28'),('4','29'),('4','3'),('4','30'),('4','31'),('4','32'),('4','33'),('4','34'),('4','35'),('4','36'),('4','37'),('4','38'),('4','39'),('4','4'),('4','40'),('4','41'),('4','42'),('4','43'),('4','44'),('4','45'),('4','46'),('4','47'),('4','48'),('4','49'),('4','5'),('4','50'),('4','51'),('4','52'),('4','53'),('4','54'),('4','55'),('4','56'),('4','57'),('4','58'),('4','59'),('4','6'),('4','60'),('4','61'),('4','62'),('4','63'),('4','64'),('4','65'),('4','66'),('4','67'),('4','68'),('4','69'),('4','7'),('4','70'),('4','8'),('4','9'),('5','1'),('5','10'),('5','11'),('5','12'),('5','13'),('5','14'),('5','15'),('5','16'),('5','17'),('5','18'),('5','19'),('5','2'),('5','20'),('5','21'),('5','22'),('5','23'),('5','24'),('5','25'),('5','26'),('5','27'),('5','28'),('5','29'),('5','3'),('5','30'),('5','31'),('5','32'),('5','33'),('5','34'),('5','35'),('5','36'),('5','37'),('5','38'),('5','39'),('5','4'),('5','40'),('5','41'),('5','42'),('5','43'),('5','44'),('5','45'),('5','46'),('5','47'),('5','48'),('5','49'),('5','5'),('5','50'),('5','51'),('5','52'),('5','53'),('5','54'),('5','55'),('5','56'),('5','57'),('5','58'),('5','59'),('5','6'),('5','60'),('5','61'),('5','62'),('5','63'),('5','64'),('5','65'),('5','66'),('5','67'),('5','68'),('5','69'),('5','7'),('5','70'),('5','8'),('5','9'),('6','1'),('6','10'),('6','11'),('6','12'),('6','13'),('6','14'),('6','15'),('6','16'),('6','17'),('6','18'),('6','19'),('6','2'),('6','20'),('6','21'),('6','22'),('6','23'),('6','24'),('6','25'),('6','26'),('6','27'),('6','28'),('6','29'),('6','3'),('6','30'),('6','31'),('6','32'),('6','33'),('6','34'),('6','35'),('6','36'),('6','37'),('6','38'),('6','39'),('6','4'),('6','40'),('6','41'),('6','42'),('6','43'),('6','44'),('6','45'),('6','46'),('6','47'),('6','48'),('6','49'),('6','5'),('6','50'),('6','51'),('6','52'),('6','53'),('6','54'),('6','55'),('6','56'),('6','57'),('6','58'),('6','59'),('6','6'),('6','60'),('6','61'),('6','62'),('6','63'),('6','64'),('6','65'),('6','66'),('6','67'),('6','68'),('6','69'),('6','7'),('6','70'),('6','8'),('6','9'),('7','1'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','2'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','27'),('7','28'),('7','29'),('7','3'),('7','30'),('7','31'),('7','32'),('7','33'),('7','34'),('7','35'),('7','36'),('7','37'),('7','38'),('7','39'),('7','4'),('7','40'),('7','41'),('7','42'),('7','43'),('7','44'),('7','45'),('7','46'),('7','47'),('7','48'),('7','49'),('7','5'),('7','50'),('7','51'),('7','52'),('7','53'),('7','54'),('7','55'),('7','56'),('7','57'),('7','58'),('7','59'),('7','6'),('7','60'),('7','61'),('7','62'),('7','63'),('7','64'),('7','65'),('7','66'),('7','67'),('7','68'),('7','69'),('7','7'),('7','70'),('7','8'),('7','9');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` varchar(64) NOT NULL COMMENT 'æœºæ„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-æœºæ„';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` VALUES ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `company_id` varchar(64) NOT NULL COMMENT 'å½’å±å…¬å¸',
  `office_id` varchar(64) NOT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `login_name` varchar(100) NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) DEFAULT NULL COMMENT 'æ‰‹æœº',
  `user_type` char(1) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹',
  `login_ip` varchar(100) DEFAULT NULL COMMENT 'æœ€åç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»é™†æ—¶é—´',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','1','1','thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','Thinkgem','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æœ€é«˜ç®¡ç†å‘˜','0'),('10','7','11','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0010','å±±ä¸œçœåˆ†å…¬å¸æŠ€æœ¯éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸æŠ€æœ¯éƒ¨','0'),('11','12','13','sdjn_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0011','æµåˆ†å…¬å¸é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æµå—åˆ†å…¬å¸é¢†å¯¼','0'),('12','12','18','sdjnlc_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0012','æµåˆ†å†åŸé¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æµå—å¸‚å†åŸåŒºåˆ†å…¬å¸é¢†å¯¼','0'),('13','22','23','sdjnlx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','æµåˆ†å†ä¸‹é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸é¢†å¯¼','0'),('14','22','24','sdjnlx_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0014','æµåˆ†å†ä¸‹ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸ç»¼åˆéƒ¨','0'),('2','1','1','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','ç®¡ç†å‘˜','thinkgem@163.com','8675','8675',NULL,'0:0:0:0:0:0:0:1','2014-06-08 02:41:33','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','ç®¡ç†å‘˜','0'),('3','1','3','bj_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','ç»¼åˆéƒ¨','0'),('4','1','4','bj_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','å¸‚åœºéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','å¸‚åœºéƒ¨','0'),('5','1','5','bj_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','æŠ€æœ¯éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','æŠ€æœ¯éƒ¨','0'),('6','1','6','bj_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','ç ”å‘éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','ç ”å‘éƒ¨','0'),('7','7','8','sd_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0007','å±±åˆ†é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸é¢†å¯¼','0'),('8','7','9','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0008','å±±åˆ†ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸ç»¼åˆéƒ¨','0'),('9','7','10','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0009','å±±åˆ†å¸‚åœºéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸å¸‚åœºéƒ¨','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·-è§’è‰²';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('1','1'),('10','2'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','2'),('4','3'),('5','4'),('6','5'),('7','2'),('7','7'),('8','2'),('9','1');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-08 13:39:08
