#!/usr/bin/perl
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

use utf8;

# --------------------------------

$Lang{Start_Archive} = "開始備份";
$Lang{Stop_Dequeue_Archive} = "中止／取消備份";
$Lang{Start_Full_Backup} = "開始完全備份";
$Lang{Start_Incr_Backup} = "開始增量備份";
$Lang{Stop_Dequeue_Backup} = "中止／取消備份";
$Lang{Restore} = "回存";

$Lang{Type_full} = "完全";
$Lang{Type_incr} = "增量";

# -----

$Lang{Only_privileged_users_can_view_admin_options} = "只有特權使用者可以查看管理選項。";
$Lang{H_Admin_Options} = "BackupPC 伺服器：管理選項";
$Lang{Admin_Options} = "管理選項";
$Lang{Admin_Options_Page} = <<EOF;
\${h1(qq{$Lang{Admin_Options}})}
<br>
\${h2("伺服器控制")}
<form name="ReloadForm" action="\$MyURL" method="get">
<input type="hidden" name="action" value="">
<table class="tableStnd">
  <tr><td>更新伺服器設定：<td><input type="button" value="更新設定"
     onClick="document.ReloadForm.action.value='Reload';
              document.ReloadForm.submit();">
</table>
</form>
<!--
\${h2("伺服器設定")}
<ul>
  <li><i>其它選項，如：</i>
  <li>更改伺服器設定
</ul>
-->
EOF

$Lang{Unable_to_connect_to_BackupPC_server} = "無法連接到 BackupPC 伺服器";
$Lang{Unable_to_connect_to_BackupPC_server_error_message} = <<EOF;
CGI 腳本程序 (\$MyURL) 無法連接到 BackupPC 伺服器 \$Conf{ServerHost} 連接埠 \$Conf{ServerPort}。錯誤訊息：\$err。
可能 BackupPC 伺服器沒有執行，或者伺服器設定不正確。請通知網路系統管理員。
EOF

$Lang{Admin_Start_Server} = <<EOF;
\${h1(qq{$Lang{Unable_to_connect_to_BackupPC_server}})}
<form action="\$MyURL" method="get">
BackupPC 伺服器 <tt>\$Conf{ServerHost}</tt> 連接埠 <tt>\$Conf{ServerPort}</tt>
此刻沒有執行（可能剛被停止，或者還沒被啓動）。<br>
你想現在啓動它嗎？
<input type="hidden" name="action" value="startServer">
<input type="submit" value="啓動伺服器" name="ignore">
</form>
EOF

# -----

$Lang{H_BackupPC_Server_Status} = "BackupPC 伺服器狀態";

$Lang{BackupPC_Server_Status_General_Info}= <<EOF;
\${h2(\"伺服器狀態一般訊息\")}

<ul>
<li> 伺服器行程是 \$Info{pid}，執行在主機 \$Conf{ServerHost} 上，
     版本號 \$Info{Version}，開始執行於 \$serverStartTime。
<li> 此狀態報告生成於 \$now。
<li> 伺服器設定最近一次加載於 \$configLoadTime。
<li> 伺服器任務駐列下次啓動時間是 \$nextWakeupTime。
<li> 其它訊息：
    <ul>
        <li>\$numBgQueue 個自上次殘留備份請求，
        <li>\$numUserQueue 個待處理使用者備份請求，
        <li>\$numCmdQueue 個待處理命令請求，
        \$poolInfo
        <li>備份池檔案系統硬碟空間佔用率是 \$Info{DUlastValue}%
            （統計於 \$DUlastTime），今天的最大佔用率是 \$Info{DUDailyMax}%（統計於 \$DUmaxTime），
            昨天的最大佔用率是 \$Info{DUDailyMaxPrev}%。
        <li>Inode 備份池檔案系統硬碟空間佔用率是 \$Info{DUInodelastValue}%
            （統計於 \$DUlastTime），今天的最大佔用率是 \$Info{DUInodeDailyMax}%（統計於 \$DUInodemaxTime），
            昨天的最大佔用率是 \$Info{DUInodeDailyMaxPrev}%。
    </ul>
</ul>
EOF

$Lang{BackupPC_Server_Status} = <<EOF;
\${h1(qq{$Lang{H_BackupPC_Server_Status}})}

<p>
\${h2("正在執行的任務")}
<p>
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td> 客戶端 </td>
    <td> 類型 </td>
    <td> 使用者	</td>
    <td> 開始時間 </td>
    <td> 命令 </td>
    <td align="center"> 行程 </td>
    <td align="center"> 傳輸行程 </td>
    <td align="center"> 狀態 </td>
    <td align="center"> 計次 </td>
    </tr>
\$jobStr
</table>

<p>
\$generalInfo

\${h2("需要關注的錯誤")}
<p>
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td align="center"> 客戶端 </td>
    <td align="center"> 類型 </td>
    <td align="center"> 使用者 </td>
    <td align="center"> 最後一次嘗試 </td>
    <td align="center"> 詳情 </td>
    <td align="center"> 錯誤時間 </td>
    <td> 最後一次錯誤（ PING 失敗除外） </td></tr>
\$statusStr
</table>
EOF

# --------------------------------
$Lang{BackupPC__Server_Summary} = "BackupPC: 客戶端報告";
$Lang{BackupPC__Archive} = "BackupPC: 備份";
$Lang{BackupPC_Summary} = <<EOF;

\${h1(qq{$Lang{BackupPC__Server_Summary}})}
<p>
<ul>
<li>此狀態報告生成於 \$now。
<li>備份池檔案系統硬碟空間佔用率是 \$Info{DUlastValue}%
    （統計於 \$DUlastTime），今天的最大佔用率是 \$Info{DUDailyMax}%（統計於 \$DUmaxTime），
    昨天的最大佔用率是 \$Info{DUDailyMaxPrev}%。
<li>Inode 備份池檔案系統硬碟空間佔用率是 \$Info{DUInodelastValue}%
    （統計於 \$DUlastTime），今天的最大佔用率是 \$Info{DUInodeDailyMax}%（統計於 \$DUInodemaxTime），
    昨天的最大佔用率是 \$Info{DUInodeDailyMaxPrev}%。
</ul>
</p>

\${h2("已成功完成備份的客戶端")}
<p>
有 \$hostCntGood 台客戶端已完成備份，總數是：
<ul>
<li> \$fullTot 個完全備份，總大小是 \${fullSizeTot}GiB
     （被壓縮前值），
<li> \$incrTot 個增量備份，總大小是 \${incrSizeTot}GiB
     （被壓縮前值）。
</ul>
</p>
<table class="sortable" id="host_summary_backups" border cellpadding="3" cellspacing="1">
<tr class="tableheader"><td> 客戶端 </td>
    <td align="center"> 使用者 </td>
    <td align="center"> 評論 </td>
    <td align="center"> 完全備份個數 </td>
    <td align="center"> 最後一次完全備份 (天前) </td>
    <td align="center"> 完全備份大小 (GiB) </td>
    <td align="center"> 完全備份速度 (MB/s) </td>
    <td align="center"> 增量備份個數 </td>
    <td align="center"> 最後一次增量備份 (天前) </td>
    <td align="center"> 最後一次備份 (天前) </td>
    <td align="center"> 當前狀態 </td>
    <td align="center"> 傳輸錯誤數目 </td>
    <td align="center"> 最後一次備份結果 </td></tr>
\$strGood
</table>
\${h2("未備份過的客戶端")}
<p>
有 \$hostCntNone 台客戶端從未被備份過。
<p>
<table class="sortable tbl-BackupPC_Summary-Hosts_with_no_Backups" id="host_summary_nobackups" border cellpadding="3" cellspacing="1">
<tr class="tableheader"><td> 客戶端 </td>
    <td align="center"> 使用者 </td>
    <td align="center"> 評論 </td>
    <td align="center"> 完全備份個數 </td>
    <td align="center"> 最後一次完全備份 (天前) </td>
    <td align="center"> 完全備份大小 (GiB) </td>
    <td align="center"> 完全備份速度 (MB/s) </td>
    <td align="center"> 增量備份個數 </td>
    <td align="center"> 最後一次增量備份 (天前) </td>
    <td align="center"> 最後一次備份 (天前) </td>
    <td align="center"> 當前狀態 </td>
    <td align="center"> 傳輸錯誤數目 </td>
    <td align="center"> 最後一次備份結果 </td></tr>
\$strNone
</table>
EOF

$Lang{BackupPC_Archive} = <<EOF;
\${h1(qq{$Lang{BackupPC__Archive}})}
<script language="javascript" type="text/javascript">
<!--

    function checkAll(location)
    {
      for (var i=0;i<document.form1.elements.length;i++)
      {
        var e = document.form1.elements[i];
        if ((e.checked || !e.checked) && e.name != \'all\') {
            if (eval("document.form1."+location+".checked")) {
                e.checked = true;
            } else {
                e.checked = false;
            }
        }
      }
    }

    function toggleThis(checkbox)
    {
       var cb = eval("document.form1."+checkbox);
       cb.checked = !cb.checked;
    }

//-->
</script>

一共有 \$hostCntGood 台客戶端已經被備份，總備份大小爲 \${fullSizeTot}GiB
<p>
<form name="form1" method="post" action="\$MyURL">
<input type="hidden" name="fcbMax" value="\$checkBoxCnt">
<input type="hidden" name="type" value="1">
<input type="hidden" name="host" value="\${EscHTML(\$archHost)}">
<input type="hidden" name="action" value="Archive">
<table class="tableStnd tbl-BackupPC_Archive-hosts" border cellpadding="3" cellspacing="1">
<tr class="tableheader"><td align=center> 客戶端 </td>
    <td align="center"> 使用者 </td>
    <td align="center"> 備份大小 </td>
\$strGood
\$checkAllHosts
</table>
</form>
<p>

EOF

$Lang{BackupPC_Archive2} = <<EOF;
\${h1(qq{$Lang{BackupPC__Archive}})}
即將爲下列客戶端備份
<ul>
\$HostListStr
</ul>
<form action="\$MyURL" method="post">
\$hiddenStr
<input type="hidden" name="action" value="Archive">
<input type="hidden" name="host" value="\${EscHTML(\$archHost)}">
<input type="hidden" name="type" value="2">
<input type="hidden" value="0" name="archive_type">
<table class="tableStnd" border cellspacing="1" cellpadding="3">
\$paramStr
<tr>
    <td colspan=2><input type="submit" value="開始備份" name="ignore"></td>
</tr>
</form>
</table>
EOF

$Lang{BackupPC_Archive2_location} = <<EOF;
<tr>
    <td>備份目的地／外設</td>
    <td><input type="text" value="\$ArchiveDest" name="archive_device"></td>
</tr>
EOF

$Lang{BackupPC_Archive2_compression} = <<EOF;
<tr>
    <td>壓縮</td>
    <td>
    <input type="radio" value="0" name="compression" \$ArchiveCompNone>無<br>
    <input type="radio" value="1" name="compression" \$ArchiveCompGzip>gzip<br>
    <input type="radio" value="2" name="compression" \$ArchiveCompBzip2>bzip2
    </td>
</tr>
EOF

$Lang{BackupPC_Archive2_parity} = <<EOF;
<tr>
    <td>奇偶校驗數據比例 (0 = 不啓用，5 = 典型設置)</td>
    <td><input type="numeric" value="\$ArchivePar" name="par"></td>
</tr>
EOF

$Lang{BackupPC_Archive2_split} = <<EOF;
<tr>
    <td>將輸出分開爲</td>
    <td><input type="numeric" value="\$ArchiveSplit" name="splitsize">兆字節</td>
</tr>
EOF

# -----------------------------------
$Lang{Pool_Stat} = <<EOF;
        <li>備份伺服器檔案池大小是 \${poolSize}GiB 包含 \$info->{"\${name}FileCnt"} 個檔案
            和 \$info->{"\${name}DirCnt"} 個檔案夾／目錄（截至 \$poolTime）。檔案池大小基本就是所有備份數據佔用的實際硬碟空間。
        <li>伺服器檔案池散列操作(Hashing)發現 \$info->{"\${name}FileCntRep"} 
            個檔案具有重複散列值，其中 \$info->{"\${name}FileRepMax"} 個檔案具有相同散列值。相同散列值並不意味着相同檔案。散列操作被用來節省相同檔案所佔用的硬碟空間。
        <li>每日例行清理過期數據操作刪除了 \$info->{"\${name}FileCntRm"} 個檔案共
             \${poolRmSize}GiB （操作於 \$poolTime ）。
EOF

# --------------------------------
$Lang{BackupPC__Backup_Requested_on__host} = "BackupPC: 客戶端 \$host 有備份請求";
$Lang{BackupPC__Delete_Requested_for_a_backup_of__host} = "BackupPC: Delete Requested for a backup of \$host";
# --------------------------------
$Lang{REPLY_FROM_SERVER} = <<EOF;
\${h1(\$str)}
<p>
伺服器答覆是：\$reply
<p>
返回 <a href="\$MyURL?host=\$host">\$host 主頁</a>。
EOF
# --------------------------------
$Lang{BackupPC__Start_Backup_Confirm_on__host} = "BackupPC: 客戶端 \$host 開始備份確認";
# --------------------------------
$Lang{Are_you_sure_start} = <<EOF;
\${h1("確定？")}
<p>
你即將在客戶端 \$host 上開始 \$type 備份。

<form name="Confirm" action="\$MyURL" method="get">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="hostIP" value="\$ipAddr">
<input type="hidden" name="doit" value="1">
<input type="hidden" name="action" value="">
你能確定嗎？
<input type="button" value="\$buttonText"
  onClick="document.Confirm.action.value='\$In{action}';
           document.Confirm.submit();">
<input type="submit" value="取消" name="ignore">
</form>
EOF
# --------------------------------
$Lang{BackupPC__Stop_Backup_Confirm_on__host} = "BackupPC: 客戶端 \$host 停止備份確認";
# --------------------------------
$Lang{Are_you_sure_stop} = <<EOF;

\${h1("確定？")}

<p>
你即將在客戶端 \$host 上停止／取消備份操作；

<form name="Confirm" action="\$MyURL" method="get">
<input type="hidden" name="host"   value="\$host">
<input type="hidden" name="doit"   value="1">
<input type="hidden" name="action" value="">
如果確定取消備份操作，請從現在起
<input type="text" name="backoff" size="10" value="\$backoff"> 小時內不要再啓動另一備份操作。
<p>
你能確定嗎？
<input type="button" value="\$buttonText"
  onClick="document.Confirm.action.value='\$In{action}';
           document.Confirm.submit();">
<input type="submit" value="不" name="ignore">
</form>

EOF
# --------------------------------
$Lang{Only_privileged_users_can_view_queues_} = "只有特權使用者可以查看任務請求駐列。";
# --------------------------------
$Lang{Only_privileged_users_can_archive} = "只有特權使用者可以執行備份操作。";
# --------------------------------
$Lang{BackupPC__Queue_Summary} = "BackupPC: 駐列報告";
# --------------------------------
$Lang{Backup_Queue_Summary} = <<EOF;
\${h1("備份請求駐列報告")}
\${h2("使用者駐列報告")}
<p>
下列使用者請求排在駐列中：
</p>
<table class="tableStnd sortable tbl-User_Queue_Summary" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> 客戶端 </td>
    <td> Action </td>
    <td> 請求時間 </td>
    <td> 使用者 </td></tr>
\$strUser
</table>

\${h2("後台請求駐列報告")}
<p>
下列後台請求排在駐列中：
</p>
<table class="tableStnd sortable tbl-User_Queue_Summary" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> 客戶端 </td>
    <td> Action </td>
    <td> 請求時間 </td>
    <td> 使用者 </td></tr>
\$strBg
</table>
\${h2("命令駐列報告")}
<p>
下列命令請求排在駐列中：
</p>
<table class="tableStnd sortable tbl-User_Queue_Summary" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td> 客戶端 </td>
    <td> Action </td>
    <td> 請求時間 </td>
    <td> 使用者 </td>
    <td> 命令 </td></tr>
\$strCmd
</table>
EOF

# --------------------------------
$Lang{Backup_PC__Log_File__file} = "BackupPC: 日誌檔 \$file";
$Lang{Log_File__file__comment} = <<EOF;
\${h1("日誌檔 \$file \$comment")}
<p>
EOF
# --------------------------------
$Lang{Contents_of_log_file} = <<EOF;
日誌檔 <tt>\$file</tt>， 修改時間 \$mtimeStr \$comment
EOF

# --------------------------------
$Lang{skipped__skipped_lines} = "[ 略過 \$skipped 行 ]\n";
# --------------------------------
$Lang{_pre___Can_t_open_log_file__file} = "<pre>\n無法打開日誌檔 \$file\n";

# --------------------------------
$Lang{BackupPC__Log_File_History} = "BackupPC: 日誌檔歷史";
$Lang{Log_File_History__hdr} = <<EOF;
\${h1("日誌檔歷史 \$hdr")}
<p>
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> 檔案 </td>
    <td align="center"> 大小 </td>
    <td align="center"> 修改時間 </td></tr>
\$str
</table>
EOF

# -------------------------------
$Lang{Recent_Email_Summary} = <<EOF;
\${h1("最近電子郵件報告（最新排前）")}
<p>
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> 收信人 </td>
    <td align="center"> 客戶端 </td>
    <td align="center"> 時間 </td>
    <td align="center"> 標題 </td></tr>
\$str
</table>
EOF
 

# ------------------------------
$Lang{Browse_backup__num_for__host} = "BackupPC: 瀏覽客戶端 \$host 備份序列號 \$num";

# ------------------------------
$Lang{Restore_Options_for__host} = "BackupPC: 客戶端 \$host 恢複選項";
$Lang{Restore_Options_for__host2} = <<EOF;
\${h1("客戶端 \$host 恢複選項")}
<p>
你從備份序列 #\$num，卷 \$share 中選擇了以下檔案／目錄：
<ul>
\$fileListStr
</ul>
</p><p>
你有三種選擇來恢復這些檔案／目錄。
請從下列三種方法中選擇其一。
</p>
\${h2("方法 1：直接恢復")}
<p>
EOF

$Lang{Restore_Options_for__host_Option1} = <<EOF;
你可以將這些檔案直接恢復到客戶端 <b>\$directHost</b> 上。
</p><p>
<b>警告：</b> 客戶端上現存的檔案，如果和被恢復的檔案具有相同檔案名並且位於相同路徑，其內容將會被取代！
</p>
<form action="\$MyURL" method="post" name="direct">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="3">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<table class="tableStnd" border="0">
<tr>
    <td>恢復到客戶端</td>
    <td><!--<input type="text" size="40" value="\${EscHTML(\$host)}"
	 name="hostDest">-->
	 <select name="hostDest" onChange="document.direct.shareDest.value=''">
	 \$hostDestSel
	 </select>
	 <script language="Javascript">
	 function myOpen(URL) {
		window.open(URL,'','width=500,height=400');
	 }
	 </script>
	 <!--<a href="javascript:myOpen('\$MyURL?action=findShares&host='+document.direct.hostDest.options.value)">搜尋可供使用的檔案卷（此功能還未被實現）</a>--></td>
</tr><tr>
    <td>恢復到卷</td>
    <td><input type="text" size="40" value="\${EscHTML(\$share)}"
	 name="shareDest"></td>
</tr><tr>
    <td>恢復到此目錄中<br>（位於上述卷下）</td>
    <td valign="top"><input type="text" size="40" maxlength="256"
	value="\${EscHTML(\$pathHdr)}" name="pathHdr"></td>
</tr><tr>
    <td><input type="submit" value="開始恢復" name="ignore"></td>
</table>
</form>
EOF

$Lang{Restore_Options_for__host_Option1_disabled} = <<EOF;
直接恢復到客戶端 \${EscHTML(\$hostDest) 的功能被關閉。
請選擇其它恢複方法。
EOF

# ------------------------------
$Lang{Option_2__Download_Zip_archive} = <<EOF;
<p>
\${h2("方法 2：下載 Zip 備份")}
<p>
你可以將所有你選擇的檔案和目錄下載進一個 Zip 備份。然後再用一個本地應用，
例如 WinZip，來瀏覽或提取其中的任何檔案。 
</p><p>
<b>警告：</b> 取決於你選擇的檔案／目錄，此備份可能會佔用很大存儲空間。
可能需要若干分鐘或更長時間來生成和傳輸此備份，並且還需要足夠大的本地硬碟空間。
</p>
<form action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="2">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<input type="checkbox" value="1" name="relative" checked> 備份中所有檔案具有相對路徑，在 \${EscHTML(\$pathHdr eq "" ? "/" : \$pathHdr)} 目錄內
（否則備份中檔案具有完整路徑）。
<br>
<table class="tableStnd" border="0">
<tr>
    <td>選擇壓縮比（0＝不壓縮，1＝最低但速度快，...，9＝最高但速度慢）</td>
    <td><input type="text" size="6" value="5" name="compressLevel"></td>
</tr><tr>
    <td>Code page (e.g. cp866)</td>
    <td><input type="text" size="6" value="utf8" name="codePage"></td>
</tr>
</table>
<br>
<input type="submit" value="下載 Zip 檔案" name="ignore">
</form>
EOF

# ------------------------------

$Lang{Option_2__Download_Zip_archive2} = <<EOF;
<p>
\${h2("方法 2：下載 Zip 備份")}
<p>
因伺服器沒有安裝 Perl 組件 Archive::Zip，Zip 備份無法被生成。
請聯繫系統管理員安裝 Archive::Zip，下載地址
<a href="http://www.cpan.org">www.cpan.org</a>。
</p>
EOF


# ------------------------------
$Lang{Option_3__Download_Zip_archive} = <<EOF;
\${h2("方法 3：下載 Tar 備份")}
<p>
你可以將所有你選擇的檔案和目錄下載進一個 Tar 備份。然後再用一個本地應用，
例如 tar 或 WinZip，來瀏覽或提取其中的任何檔案。 
</p><p>
<b>警告：</b> 取決於你選擇的檔案／目錄，此備份可能會佔用很大存儲空間。
可能需要若干分鐘或更長時間來生成和傳輸此備份，並且還需要足夠大的本地硬碟空間。
</p>
<form action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="1">
\$hiddenStr
<input type="hidden" value="\$In{action}" name="action">
<input type="checkbox" value="1" name="relative" checked> 備份中所有檔案具有相對路徑，在 \${EscHTML(\$pathHdr eq "" ? "/" : \$pathHdr)} 目錄內
（否則備份中檔案具有完整路徑）。
<br>
<input type="submit" value="下載 Tar 檔案" name="ignore">
</form>
EOF


# ------------------------------
$Lang{Restore_Confirm_on__host} = "BackupPC: 客戶端 \$host 開始恢復確認";

$Lang{Are_you_sure} = <<EOF;
\${h1("確定？")}
<p>
你即將開始恢復數據直接到客戶端 \$In{hostDest} 上。
儲存在備份號 \$num 中的下列檔案將被恢復到卷 \$In{shareDest} 內：
<p>
<table class="tableStnd" border>
<tr class="tableheader"><td>原始檔案／目錄</td><td>將被恢復到</td></tr>
\$fileListStr
</table>

<form name="RestoreForm" action="\$MyURL" method="post">
<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="hostDest" value="\${EscHTML(\$In{hostDest})}">
<input type="hidden" name="shareDest" value="\${EscHTML(\$In{shareDest})}">
<input type="hidden" name="pathHdr" value="\${EscHTML(\$In{pathHdr})}">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="type" value="4">
<input type="hidden" name="action" value="">
\$hiddenStr
你確定嗎？
<input type="button" value="\$Lang->{Restore}"
 onClick="document.RestoreForm.action.value='Restore';
          document.RestoreForm.submit();">
<input type="submit" value="不" name="ignore">
</form>
EOF


# --------------------------
$Lang{Restore_Requested_on__hostDest} = "BackupPC: 客戶端 \$hostDest 有恢復請求";
$Lang{Reply_from_server_was___reply} = <<EOF;
\${h1(\$str)}
<p>
伺服器答覆是：\$reply
<p>
返回 <a href="\$MyURL?host=\$hostDest">\$hostDest 主頁</a>。
EOF

$Lang{BackupPC_Archive_Reply_from_server} = <<EOF;
\${h1(\$str)}
<p>
伺服器答覆是：\$reply
EOF


# --------------------------------
$Lang{BackupPC__Delete_Backup_Confirm__num_of__host} = "BackupPC: 刪除備份確認 序號 #\$num 主機 \$host";
# --------------------------------
$Lang{A_filled} = "a filled";
$Lang{An_unfilled} = "an unfilled";
$Lang{Are_you_sure_delete} = <<EOF;
\${h1("你確定?")}
<p>
You are about to delete \$filled \$type backup #\$num of \$host.

<form name="Confirm" action="\$MyURL" method="get">

<input type="hidden" name="host" value="\${EscHTML(\$host)}">
<input type="hidden" name="num" value="\$num">

<input type="hidden" name="doit" value="1">
<input type="hidden" name="action" value="">

Do you really want to do this?

<input type="button" value="\${EscHTML(\$Lang->{CfgEdit_Button_Delete})}"
 onClick="document.Confirm.action.value='deleteBackup';
          document.Confirm.submit();">

<input type="submit" value="No" name="ignore">
</form>
EOF

# -------------------------
$Lang{Host__host_Backup_Summary} = "BackupPC: 客戶端 \$host 備份報告";

$Lang{Host__host_Backup_Summary2} = <<EOF;
\${h1("客戶端 \$host 備份報告")}
<p>
\$warnStr
<ul>
\$statusStr
</ul>
</p>
\${h2("使用者操作")}
<p>
<form name="StartStopForm" action="\$MyURL" method="get">
<input type="hidden" name="host"   value="\$host">
<input type="hidden" name="action" value="">
\$startIncrStr
<input type="button" value="\$Lang->{Start_Full_Backup}"
 onClick="document.StartStopForm.action.value='Start_Full_Backup';
          document.StartStopForm.submit();">
<input type="button" value="\$Lang->{Stop_Dequeue_Backup}"
 onClick="document.StartStopForm.action.value='Stop_Dequeue_Backup';
          document.StartStopForm.submit();">
</form>
</p>
\${h2("備份報告")}
<p>
點擊備份序列號瀏覽和恢復檔案。
</p>
<table class="tableStnd sortable tbl-host_Backup_Summary-backup" border cellspacing="1" cellpadding="3">
<tr class="tableheader"><td align="center"> 備份序列號＃ </td>
    <td align="center"> 類型 </td>
    <td align="center"> 完整 </td>
    <td align="center"> 備份級別 </td>
    <td align="center"> 開始時間 </td>
    <td align="center"> 耗時（分鐘）</td>
    <td align="center"> 距離現在（天前）</td>
    <td align="center"> 保留 </td>
    \$deleteHdrStr
    <td align="center"> 評論 </td>
</tr>
\$str
</table>
<p>

\$restoreStr
</p>
\${h2("傳輸錯誤報告")}
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> 備份序列號＃ </td>
    <td align="center"> 類型 </td>
    <td align="center"> 查看 </td>
    <td align="center"> 傳輸錯誤數目 </td>
    <td align="center"> 損壞檔案數目 </td>
    <td align="center"> 損壞檔案系統卷數目 </td>
    <td align="center"> 損壞 Tar 檔案數目 </td>
</tr>
\$errStr
</table>

\${h2("檔案大小／數目統計")}
<p>
"原有檔案"是指原先已存在備份池中的檔案；"新增檔案"是指備份新寫入池中的檔案。
空檔案不被統計在內。
</p>
<table class="tableStnd sortable tbl-host_Backup_Summary-reuse" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td colspan="2" bgcolor="#ffffff"></td>
    <td align="center" colspan="3"> 合計 </td>
    <td align="center" colspan="2"> 原有檔案 </td>
    <td align="center" colspan="2"> 新增檔案 </td>
</tr>
<tr class="tableheader sortheader">
    <td align="center"> 備份序列號＃ </td>
    <td align="center"> 類型 </td>
    <td align="center"> 檔案數目 </td>
    <td align="center"> 大小(MB) </td>
    <td align="center"> 備份速度(MB/sec) </td>
    <td align="center"> 檔案數目 </td>
    <td align="center"> 大小(MB) </td>
    <td align="center"> 檔案數目 </td>
    <td align="center"> 大小(MB) </td>
</tr>
\$sizeStr
</table>

\${h2("壓縮報告")}
<p>
備份池中原有檔案和新增檔案的壓縮性能報告。
</p>
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td colspan="3" bgcolor="#ffffff"></td>
    <td align="center" colspan="3"> 原有檔案 </td>
    <td align="center" colspan="3"> 新增檔案 </td>
</tr>
<tr class="tableheader sortheader"><td align="center"> 備份序列號＃ </td>
    <td align="center"> 類型 </td>
    <td align="center"> 壓縮級別 </td>
    <td align="center"> 壓縮前(MB) </td>
    <td align="center"> 壓縮後(MB) </td>
    <td align="center"> 壓縮比 </td>
    <td align="center"> 壓縮前(MB) </td>
    <td align="center"> 壓縮後(MB) </td>
    <td align="center"> 壓縮比 </td>
</tr>
\$compStr
</table>
EOF

$Lang{Host__host_Archive_Summary} = "BackupPC: 客戶端 \$host 備份報告";
$Lang{Host__host_Archive_Summary2} = <<EOF;
\${h1("客戶端 \$host 備份報告")}
<p>
\$warnStr
<ul>
\$statusStr
</ul>

\${h2("使用者操作")}
<p>
<form name="StartStopForm" action="\$MyURL" method="get">
<input type="hidden" name="archivehost" value="\$host">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="action" value="">
<input type="button" value="\$Lang->{Start_Archive}"
 onClick="document.StartStopForm.action.value='Start_Archive';
          document.StartStopForm.submit();">
<input type="button" value="\$Lang->{Stop_Dequeue_Archive}"
 onClick="document.StartStopForm.action.value='Stop_Dequeue_Archive';
          document.StartStopForm.submit();">
</form>

\$ArchiveStr

EOF

# -------------------------
$Lang{Error} = "BackupPC: 錯誤";
$Lang{Error____head} = <<EOF;
\${h1("錯誤：\$head")}
<p>\$mesg</p>
EOF

# -------------------------
$Lang{NavSectionTitle_} = "伺服器";

# -------------------------
$Lang{Backup_browse_for__host} = <<EOF;
\${h1("客戶端 \$host 備份瀏覽")}

<script language="javascript" type="text/javascript">
<!--

    function checkAll(location)
    {
      for (var i=0;i<document.form1.elements.length;i++)
      {
        var e = document.form1.elements[i];
        if ((e.checked || !e.checked) && e.name != \'all\') {
            if (eval("document.form1."+location+".checked")) {
            	e.checked = true;
            } else {
            	e.checked = false;
            }
        }
      }
    }
    
    function toggleThis(checkbox)
    {
       var cb = eval("document.form1."+checkbox);
       cb.checked = !cb.checked;	
    }

//-->
</script>

<ul>
<li> 你正在瀏覽備份 #\$num，該備份開始於 \$backupTime
       （\$backupAge 天前）。
\$filledBackup
<li>
<form name="formDir" method="post" action="\$MyURL">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="share" value="\${EscHTML(\$share)}">
<input type="hidden" name="action" value="browse">
進入目錄：<input type="text" name="dir" size="60" maxlength="4096" value="\${EscHTML(\$dir)}">
    <input type="submit" value="\$Lang->{Go}" name="Submit">
</form>
<li>
<form name="formComment" method="post" action="\$MyURL">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="share" value="\${EscHTML(\$share)}">
<input type="hidden" name="action" value="browse">
評論: <input type="text" name="comment" class="inputCompact" size="60" maxlength="4096" value="\${EscHTML(\$comment)}">
    <input type="submit" value="\$Lang->{CfgEdit_Button_Save}" name="SetComment">
</form>
<li> 點撃目錄名稱進入相對應目錄。
<li> 點擊文件名稱恢復相對應文件。
<li> 查看當前目錄備份<a href="\$MyURL?action=dirHistory&host=\${EscURI(\$host)}&share=\$shareURI&dir=\$pathURI">歷史</a>。
\$share2pathStr
</ul>
</form>

\${h2("\$dirDisplay 的內容")}
<form name="form1" method="post" action="\$MyURL">
<input type="hidden" name="num" value="\$num">
<input type="hidden" name="host" value="\$host">
<input type="hidden" name="share" value="\${EscHTML(\$share)}">
<input type="hidden" name="fcbMax" value="\$checkBoxCnt">
<input type="hidden" name="action" value="Restore">
<br>
<table  class="tbl-Backup_browse-contents" width="100%">
<tr><td valign="top" width="30%">
    <table class="tbl-Backup_browse-tree" align="left" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
    \$dirStr
    </table>
</td><td width="3%">
</td><td valign="top">
    <br>
        <table class="tbl-Backup_browse-table" border width="100%" align="left" cellpadding="3" cellspacing="1">
        \$fileHeader
        \$topCheckAll
        \$fileStr
        \$checkAll
        </table>
    </td></tr></table>
<br>
<!--
This is now in the checkAll row
<input type="submit" name="Submit" value="恢復被選擇的檔案">
-->
</form>
EOF

$Lang{Browse_ClientShareName2Path} = <<EOF;
<li> 共享名稱到真實客戶端路徑的映射 (ClientShareName2Path):
    <ul>
\$share2pathStr
    </ul>
EOF

# ------------------------------
$Lang{DirHistory_backup_for__host} = "BackupPC: 客戶端 \$host 目錄備份歷史";

#
# These two strings are used to build the links for directories and
# file versions.  Files are appended with a version number.
#
$Lang{DirHistory_dirLink}  = "目錄";
$Lang{DirHistory_fileLink} = "v";

$Lang{DirHistory_for__host} = <<EOF;
\${h1("客戶端 \$host 目錄備份歷史")}
<p>
本頁顯示檔案在所有備份中的不同版本：
<ul>
<li> 點擊備份序列號返回相應備份瀏覽主頁，
<li> 點擊目錄鏈接標記 (\$Lang->{DirHistory_dirLink}) 進入相應目錄，
<li> 點擊檔案版本鏈接標記 (\$Lang->{DirHistory_fileLink}0,
     \$Lang->{DirHistory_fileLink}1, ...) 下載相應檔案，
<li> 如果一個檔案的內容在多個備份中相同，檔案在多個備份中具有相同版本號，(PleaseTranslateThis: except between v3 and v4 backups)
<li> 如果一個檔案或目錄在某個備份中不存在，下表中用空白表示，
<li> 具有相同版本號的檔案可能在不同備份中有不同的檔案屬性。可以點擊備份序列號來查看檔案在相應備份中的屬性。
</ul>

\${h2("\$dirDisplay 的歷史")}

<br>
<table class="tbl-DirHistory" border cellspacing="2" cellpadding="3">
<tr class="fviewheader"><td>備份序列號</td>\$backupNumStr</tr>
<tr class="fviewheader"><td>備份時間</td>\$backupTimeStr</tr>
\$fileStr
</table>
EOF

# ------------------------------
$Lang{Restore___num_details_for__host} = "BackupPC: 客戶端 \$host 恢復 #\$num 詳情";

$Lang{Restore___num_details_for__host2} = <<EOF;
\${h1("客戶端 \$host 恢復 #\$num 詳情")}
<p>
<table class="tableStnd tbl-Restore___num_details-details" border cellspacing="1" cellpadding="3" width="90%">
<tr><td class="tableheader"> 恢復序列號 </td><td class="border"> \$Restores[\$i]{num} </td></tr>
<tr><td class="tableheader"> 請求方 </td><td class="border"> \$RestoreReq{user} </td></tr>
<tr><td class="tableheader"> 請求時間 </td><td class="border"> \$reqTime </td></tr>
<tr><td class="tableheader"> 結果 </td><td class="border"> \$Restores[\$i]{result} </td></tr>
<tr><td class="tableheader"> 錯誤訊息 </td><td class="border"> \$Restores[\$i]{errorMsg} </td></tr>
<tr><td class="tableheader"> 源客戶端 </td><td class="border"> \$RestoreReq{hostSrc} </td></tr>
<tr><td class="tableheader"> 源備份序列號 </td><td class="border"> \$RestoreReq{num} </td></tr>
<tr><td class="tableheader"> 源檔案卷 </td><td class="border"> \$RestoreReq{shareSrc} </td></tr>
<tr><td class="tableheader"> 目的客戶端 </td><td class="border"> \$RestoreReq{hostDest} </td></tr>
<tr><td class="tableheader"> 目的檔案卷 </td><td class="border"> \$RestoreReq{shareDest} </td></tr>
<tr><td class="tableheader"> 恢復開始時間 </td><td class="border"> \$startTime </td></tr>
<tr><td class="tableheader"> 耗時 </td><td class="border"> \$duration 分鐘 </td></tr>
<tr><td class="tableheader"> 檔案個數 </td><td class="border"> \$Restores[\$i]{nFiles} </td></tr>
<tr><td class="tableheader"> 檔案總大小 </td><td class="border"> \${MB} MB </td></tr>
<tr><td class="tableheader"> 傳輸速率 </td><td class="border"> \$MBperSec MB/sec </td></tr>
<tr><td class="tableheader"> Tar 生成過程錯誤個數 </td><td class="border"> \$Restores[\$i]{tarCreateErrs} </td></tr>
<tr><td class="tableheader"> 傳輸過程錯誤個數 </td><td class="border"> \$Restores[\$i]{xferErrs} </td></tr>
<tr><td class="tableheader"> 傳輸日誌檔 </td><td class="border">
<a href="\$MyURL?action=view&type=RestoreLOG&num=\$Restores[\$i]{num}&host=\$host">查看日誌</a>,
<a href="\$MyURL?action=view&type=RestoreErr&num=\$Restores[\$i]{num}&host=\$host">查看錯誤</a>
</tr></tr>
</table>
</p>
\${h1("檔案／目錄列表")}
<p>
<table class="tableStnd tbl-Restore___num_details-fileList" border cellspacing="1" cellpadding="3" width="100%">
<tr class="tableheader"><td>原始檔案／目錄</td><td>恢復至</td></tr>
\$fileListStr
</table>
EOF

# ------------------------------
$Lang{Archive___num_details_for__host} = "BackupPC: 客戶端 \$host 備份 #\$num 詳情";

$Lang{Archive___num_details_for__host2 } = <<EOF;
\${h1("客戶端 \$host 備份 #\$num 詳情")}
<p>
<table class="tableStnd tbl-Archive___num_details-details" border cellspacing="1" cellpadding="3" width="80%">
<tr><td class="tableheader"> 備份序列號 </td><td class="border"> \$Archives[\$i]{num} </td></tr>
<tr><td class="tableheader"> 請求方 </td><td class="border"> \$ArchiveReq{user} </td></tr>
<tr><td class="tableheader"> 請求方 </td><td class="border"> \$reqTime </td></tr>
<tr><td class="tableheader"> 結果 </td><td class="border"> \$Archives[\$i]{result} </td></tr>
<tr><td class="tableheader"> 錯誤訊息 </td><td class="border"> \$Archives[\$i]{errorMsg} </td></tr>
<tr><td class="tableheader"> 開始時間 </td><td class="border"> \$startTime </td></tr>
<tr><td class="tableheader"> 耗時 </td><td class="border"> \$duration 分鐘 </td></tr>
<tr><td class="tableheader"> 傳輸日誌檔 </td><td class="border">
<a href="\$MyURL?action=view&type=ArchiveLOG&num=\$Archives[\$i]{num}&host=\$host">查看日誌</a>,
<a href="\$MyURL?action=view&type=ArchiveErr&num=\$Archives[\$i]{num}&host=\$host">查看錯誤</a>
</tr></tr>
</table>
<p>
\${h1("客戶端列表")}
<p>
<table class="tableStnd tbl-Archive___num_details-hostList" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td>客戶端</td><td>備份序列號</td></tr>
\$HostListStr
</table>
EOF

# -----------------------------------
$Lang{Email_Summary} = "BackupPC: 電子郵件報告";

# -----------------------------------
#  !! ERROR messages !!
# -----------------------------------
$Lang{BackupPC__Lib__new_failed__check_apache_error_log} = "BackupPC::Lib->new 步驟失敗：請檢查 Apache 伺服器日誌\n";
$Lang{Wrong_user__my_userid_is___} =  
              "錯誤使用者：我的使用者 ID 是 \$>, 不是 \$uid"
            . "(\$Conf{BackupPCUser})\n";
# $Lang{Only_privileged_users_can_view_PC_summaries} = "Only privileged users can view PC summaries.";
$Lang{Only_privileged_users_can_stop_or_start_backups}    = "只有特權使用者可以執行備份的開始或停止操作於客戶端 \${EscHTML(\$host)}.";
$Lang{Invalid_number__num}                                = "無效數字 \${EscHTML(\$In{num})}";
$Lang{Unable_to_open__file__configuration_problem}        = "無法打開檔案 \$file：設定有誤？";
$Lang{Only_privileged_users_can_view_log_or_config_files} = "只有特權使用者可以查看日誌或設定檔案。";
$Lang{Only_privileged_users_can_view_log_files}           = "只有特權使用者可以查看日誌檔。";
$Lang{Only_privileged_users_can_view_email_summaries}     = "只有特權使用者可以查看電子郵件報告。";
$Lang{Only_privileged_users_can_browse_backup_files}      = "只有特權使用者可以瀏覽客戶端 \${EscHTML(\$In{host})} 的備份檔案。";
$Lang{Only_privileged_users_can_delete_backups}           = "只有特權使用者可以刪除主機 \${EscHTML(\$host)} 的備份.";
$Lang{Empty_host_name}                                    = "空客戶端名稱。";
$Lang{Directory___EscHTML}                                = "目錄 \${EscHTML(\"\$TopDir/pc/\$host/\$num\")} 爲空";
$Lang{Can_t_browse_bad_directory_name2}                   = "無法瀏覽非法目錄名 \${EscHTML(\$relDir)}";
$Lang{Only_privileged_users_can_restore_backup_files}     = "只有特權使用者可以恢復客戶端 \${EscHTML(\$In{host})} 的備份檔案。";
$Lang{Bad_host_name}                                      = "錯誤客戶端名 \${EscHTML(\$host)}";
$Lang{You_haven_t_selected_any_files__please_go_Back_to}  = "你還沒有選擇任何檔案；請返回上一頁選擇檔案。";
$Lang{You_haven_t_selected_any_hosts}                     = "你還沒有選擇任何客戶端；請返回上一頁選擇客戶端。";
$Lang{Nice_try__but_you_can_t_put}                        = "對不起，檔案名內不能包含 \'..\'";
$Lang{Host__doesn_t_exist}                                = "客戶端 \${EscHTML(\$In{hostDest})} 不存在";
$Lang{You_don_t_have_permission_to_restore_onto_host}     = "你沒有權限恢復客戶端 \${EscHTML(\$In{hostDest})}";
$Lang{Can_t_open_create__openPath}                        = "無法打開／建立 \${EscHTML(\"\$openPath\")}";
$Lang{Only_privileged_users_can_restore_backup_files2}    = "只有特權使用者可以恢復客戶端 \${EscHTML(\$host)} 的備份檔案。";
$Lang{Empty_host_name}                                    = "空客戶端名";
$Lang{Unknown_host_or_user}                               = "未知客戶端或使用者 \${EscHTML(\$host)}";
$Lang{Only_privileged_users_can_view_information_about}   = "只有特權使用者可以查看客戶端 \${EscHTML(\$host)} 的訊息。" ;
$Lang{Only_privileged_users_can_view_archive_information} = "只有特權使用者可以查看備份訊息。";
$Lang{Only_privileged_users_can_view_restore_information} = "只有特權使用者可以查看恢復訊息。";
$Lang{Restore_number__num_for_host__does_not_exist}       = "客戶端 \${EscHTML(\$host)} 恢復序列號 \$num 不存在。";
$Lang{Archive_number__num_for_host__does_not_exist}       = "客戶端 \${EscHTML(\$host)} 備份序列號 \$num 不存在。";
$Lang{Can_t_find_IP_address_for}                          = "客戶端 \${EscHTML(\$host)} 的 IP 地址無法找到";
$Lang{host_is_a_DHCP_host}                                = <<EOF;
客戶端 \$host 的網路設置是使用動態 IP 地址（DHCP），現在它的 IP 地址未知。已經檢查過 \$ENV{REMOTE_ADDR}\$tryIP 的 NETBIOS 名，但那台機器不是 \$host。
<p>
除非獲得客戶端 \$host 的動態 IP 地址，否則只能從客戶主機上發出此任務請求。
EOF

# ------------------------------------
# !! Server Mesg !!
# ------------------------------------

$Lang{Backup_requested_on_DHCP__host} = "使用者 \$User 從 \$ENV{REMOTE_ADDR} 發起請求備份使用動態 IP 的客戶端 \$host (\$In{hostIP})";
$Lang{Backup_requested_on__host_by__User} = "使用者 \$User 發起請求備份客戶端 \$host";
$Lang{Backup_stopped_dequeued_on__host_by__User} = "使用者 \$User 停止／取消了對客戶端 \$host 的備份";
$Lang{Restore_requested_to_host__hostDest__backup___num} = "使用者 \$User 從 \$ENV{REMOTE_ADDR} 發起請求恢復客戶端 \$hostDest，使用備份序列號 #\$num";
$Lang{Delete_requested_for_backup_of__host_by__User} = "Delete requested for backup #\$num of \$host"
             . " by \$User from \$ENV{REMOTE_ADDR}";
$Lang{Archive_requested} = "使用者 \$User 從 \$ENV{REMOTE_ADDR} 發起備份請求";

# -------------------------------------------------
# ------- Stuff that was forgotten ----------------
# -------------------------------------------------

$Lang{Status} = "狀態";
$Lang{PC_Summary} = "客戶端報告";
$Lang{LOG_file} = "日誌檔";
$Lang{LOG_files} = "日誌檔列表";
$Lang{Old_LOGs} = "舊日誌";
$Lang{Email_summary} = "電子郵件報告";
$Lang{Config_file} = "設定檔案";
# $Lang{Hosts_file} = "Hosts file";
$Lang{Current_queues} = "當前駐列";
$Lang{Documentation} = "文件資料";

#$Lang{Host_or_User_name} = "<small>Host or User name:</small>";
$Lang{Go} = "確定";
$Lang{Hosts} = "客戶端";
$Lang{Select_a_host} = "選擇客戶端名...";

$Lang{There_have_been_no_archives} = "<h2> 這台機器還從來沒有執行過備份操作！</h2>\n";
$Lang{This_PC_has_never_been_backed_up} = "<h2> 這台機器還從來沒有被備份過！！</h2>\n";
$Lang{This_PC_is_used_by} = "<li>這台機器的使用者包括 \${UserLink(\$user)}";

$Lang{Extracting_only_Errors} = "（只提取錯誤訊息）";
$Lang{XferLOG} = "傳輸日誌";
$Lang{Errors}  = "錯誤";

# ------------
$Lang{Last_email_sent_to__was_at___subject} = <<EOF;
<li>給使用者 \${UserLink(\$user)} 的最近一封郵件送出於 \$mailTime，標題是"\$subj"。
EOF
# ------------
$Lang{The_command_cmd_is_currently_running_for_started} = <<EOF;
<li>命令 \$cmd 正在爲客戶端 \$host 執行，開始於 \$startTime。
EOF

# -----------
$Lang{Host_host_is_queued_on_the_background_queue_will_be_backed_up_soon} = <<EOF;
<li>客戶端 \$host 已在後台駐列中等待（即將被備份）。
EOF

# ----------
$Lang{Host_host_is_queued_on_the_user_queue__will_be_backed_up_soon} = <<EOF;
<li>客戶端 \$host 已在使用者駐列中等待（即將被備份）。
EOF

# ---------
$Lang{A_command_for_host_is_on_the_command_queue_will_run_soon} = <<EOF;
<li>針對客戶端 \$host 的一條命令已在命令駐列中等待（即將被執行）。
EOF

# --------
$Lang{Last_status_is_state_StatusHost_state_reason_as_of_startTime} = <<EOF;
<li>最後狀態是 \"\$Lang->{\$StatusHost{state}}\"\$reason，當時時間 \$startTime。
EOF

# --------
$Lang{Last_error_is____EscHTML_StatusHost_error} = <<EOF;
<li>最後錯誤訊息是 \"\${EscHTML(\$StatusHost{error})}\"。
EOF

# ------
$Lang{Pings_to_host_have_failed_StatusHost_deadCnt__consecutive_times} = <<EOF;
<li>試圖與客戶端 \$host 聯繫（Ping 操作）已連續失敗 \$StatusHost{deadCnt} 次。 
EOF

# -----
$Lang{Prior_to_that__pings} = "先前，Ping";

# -----
$Lang{priorStr_to_host_have_succeeded_StatusHostaliveCnt_consecutive_times} = <<EOF;
<li>\$priorStr 客戶端 \$host 已連續成功 \$StatusHost{aliveCnt} 次。
EOF

$Lang{Because__host_has_been_on_the_network_at_least__Conf_BlackoutGoodCnt_consecutive_times___} = <<EOF;
<li>因爲客戶端 \$host 已經在網路上至少連續 \$Conf{BlackoutGoodCnt} 次，
在下列時段 \$blackoutStr，它將不進行備份操作。
EOF

$Lang{__time0_to__time1_on__days} = "\$t0 to \$t1 在 \$days";

$Lang{Backups_are_deferred_for_hours_hours_change_this_number} = <<EOF;
<li>備份被推遲 \$hours 小時
(<a href=\"\$MyURL?action=Stop_Dequeue_Backup&host=\$host\">改變時間</a>)。
EOF

$Lang{tryIP} = " 和 \$StatusHost{dhcpHostIP}";

# $Lang{Host_Inhost} = "Host \$In{host}";

$Lang{checkAll} = <<EOF;
<tr><td class="fviewborder">
<input type="checkbox" name="allFiles" onClick="return checkAll('allFiles');">&nbsp;全選
</td><td colspan="5" align="center" class="fviewborder">
<input type="submit" name="Submit" value="恢復被選擇的檔案">
</td></tr>
EOF

$Lang{checkAllHosts} = <<EOF;
<tr><td class="fviewborder">
<input type="checkbox" name="allFiles" onClick="return checkAll('allFiles');">&nbsp;全選
</td><td colspan="2" align="center" class="fviewborder">
<input type="submit" name="Submit" value="備份被選擇的客戶端">
</td></tr>
EOF

$Lang{fileHeader} = <<EOF;
    <tr class="fviewheader"><td align=center> 檔案／目錄名</td>
       <td align="center"> 類型</td>
       <td align="center"> 讀寫權限</td>
       <td align="center"> 備份序列號</td>
       <td align="center"> 大小</td>
       <td align="center"> 修改日期</td>
    </tr>
EOF

$Lang{Home}                         = "主頁";
$Lang{Browse}                       = "瀏覽備份";
$Lang{Last_bad_XferLOG}             = "最近出錯傳輸日誌";
$Lang{Last_bad_XferLOG_errors_only} = "最近出錯傳輸日誌（只含錯誤）";

$Lang{This_display_is_merged_with_backup} = <<EOF;
<li> 本頁顯示的是與備份序列 #\$numF 合成的結果。
EOF

$Lang{Visit_this_directory_in_backup} = <<EOF;
<li> 選擇你想查看的備份：<select onChange="window.location=this.value">\$otherDirs </select>
EOF

$Lang{Restore_Summary} = <<EOF;
\${h2("恢復報告")}
<p>
點擊恢復序列號獲取詳情。
<table class="tableStnd sortable" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> 恢復序列號 </td>
    <td align="center"> 結果 </td>
    <td align="right"> 開始時間 </td>
    <td align="right"> 耗時（分鐘）</td>
    <td align="right"> 檔案個數 </td>
    <td align="right"> 大小(MB) </td>
    <td align="right"> Tar 錯誤個數 </td>
    <td align="right"> 傳輸錯誤個數 </td>
</tr>
\$restoreStr
</table>
<p>
EOF

$Lang{Archive_Summary} = <<EOF;
\${h2("備份報告")}
<p>
點擊備份序列號獲取詳情。
<table class="tableStnd" border cellspacing="1" cellpadding="3" width="80%">
<tr class="tableheader"><td align="center"> 備份序列號 </td>
    <td align="center"> 結果 </td>
    <td align="right"> 開始時間 </td>
    <td align="right"> 耗時（分鐘）</td>
</tr>
\$ArchiveStr
</table>
<p>
EOF

$Lang{BackupPC__Documentation} = "BackupPC: 文件資料";

$Lang{No}  = "否";
$Lang{Yes} = "是";

$Lang{The_directory_is_empty} = <<EOF;
<tr><td bgcolor="#ffffff">目錄 \$dirDisplay 是空目錄
</td></tr>
EOF

#$Lang{on} = "開";
$Lang{off} = "關";

$Lang{backupType_full}    = "完全";
$Lang{backupType_incr}    = "增量";
$Lang{backupType_active}  = "active";
$Lang{backupType_partial} = "部分";

$Lang{failed}  = "失敗";
$Lang{success} = "成功";
$Lang{and}     = "和";

# ------
# Hosts states and reasons
$Lang{Status_idle}                = "空閒";
$Lang{Status_backup_starting}     = "備份已開始";
$Lang{Status_backup_in_progress}  = "備份進行中";
$Lang{Status_restore_starting}    = "恢復已開始";
$Lang{Status_restore_in_progress} = "恢復進行中";
$Lang{Status_admin_pending}       = "檔案鏈接待建立";
$Lang{Status_admin_running}       = "檔案鏈接建立中";

$Lang{Reason_backup_done}              = "完成";
$Lang{Reason_restore_done}             = "恢復完成";
$Lang{Reason_archive_done}             = "備份完成";
$Lang{Reason_nothing_to_do}            = "空閒";
$Lang{Reason_backup_failed}            = "備份失敗";
$Lang{Reason_restore_failed}           = "恢復失敗";
$Lang{Reason_archive_failed}           = "備份失敗";
$Lang{Reason_no_ping}                  = "網路連接中斷(no ping)";
$Lang{Reason_backup_canceled_by_user}  = "備份被使用者取消";
$Lang{Reason_restore_canceled_by_user} = "恢復被使用者取消";
$Lang{Reason_archive_canceled_by_user} = "備份被使用者取消";
$Lang{Disabled_OnlyManualBackups}      = "自動備份被關閉";
$Lang{Disabled_AllBackupsDisabled}     = "關閉";


# ---------
# Email messages

# No backup ever
$Lang{EMailNoBackupEverSubj} = "BackupPC: 客戶端 \$host 從未被成功備份過";
$Lang{EMailNoBackupEverMesg} = <<'EOF';
To: $user$domain
cc:
Subject: $subj
$headers
敬愛的使用者 $userName,

您的電腦 ($host) 還從來沒有被我們的備份系統成功備份過。
正常情況下，當您的電腦與網路連接時電腦備份會自動進行。
如果您屬於下面兩種情況，請與系統管理員聯繫：

  － 您的電腦經常是連在網路上的。這意味着可能是某些設定
     方面的問題導致備份無法進行。

  － 您不希望您的電腦被備份，並且不願再收到這些電子郵件。

如果不是以上這些情況，請確認您的電腦是被連接在網路上的。

此致，

BackupPC Genie
https://backuppc.github.io/backuppc
EOF

# No recent backup
$Lang{EMailNoBackupRecentSubj} = "BackupPC: 客戶端 \$host 最近未被備份過";
$Lang{EMailNoBackupRecentMesg} = <<'EOF';
To: $user$domain
cc:
Subject: $subj
$headers
敬愛的使用者 $userName,

您的電腦 ($host) 已經有 $days 天沒有被成功備份過了。您的電腦
第一次被備份是在 $firstTime 天前，直至 $days 天前已經被備份過 $numBackups 次。
正常情況下，當您的電腦與網路連接時電腦備份會自動進行。

在最近 $days 天內，如果您的電腦已經與網路連接了若干小時，
請與系統管理員聯繫以判斷爲什麼備份沒有進行。

除此之外，如果您不在辦公室，您只能手動拷貝重要檔案到其它存儲介質上。
應該提醒您的是，如果您的電腦硬碟損壞，您在最近 $days 天內建立或修改
的檔案，包括新收到的電子郵件和附件，將無法被恢復。

此致，

BackupPC Genie
https://backuppc.github.io/backuppc
EOF

# Old Outlook files
$Lang{EMailOutlookBackupSubj} = "BackupPC: 客戶端 \$host 上的微軟 Outlook 檔案需要備份";
$Lang{EMailOutlookBackupMesg} = <<'EOF';
To: $user$domain
cc:
Subject: $subj
$headers
敬愛的使用者 $userName,

您的電腦上的 Outlook 檔案 $howLong。

這些檔案包括所有您的電子郵件，附件，通訊錄及日程表訊息。
您的電腦第一次被備份是在 $firstTime 天前，直至 $lastTime 天前已經被
備份過 $numBackups 次。但是，Outlook 在執行時鎖住所有所屬檔案，
導致這些檔案無法被備份。

建議您依以下方式備份 Outlook 檔案：

1。首先確認電腦是連接在網路上；
2。退出 Outlook 及所有其它應用；
3。使用網頁瀏覽器訪問此鏈接：

    $CgiURL?host=$host               

選擇 “開始增量備份”，啓動增量備份操作；然後選擇 “返回 $host 主頁”
並用瀏覽器的 “刷新” 功能來檢查該備份操作的狀態。

此致，

BackupPC Genie
https://backuppc.github.io/backuppc
EOF

$Lang{howLong_not_been_backed_up} = "還從未被成功備份過";
$Lang{howLong_not_been_backed_up_for_days_days} = "已經有 \$days 天未被備份過";

#######################################################################
# RSS strings
#######################################################################
$Lang{RSS_Doc_Title}       = "BackupPC 伺服器";
$Lang{RSS_Doc_Description} = "RSS feed for BackupPC";
$Lang{RSS_Host_Summary}    = <<EOF;
完全備份個數：\$fullCnt;
最後一次完全備份 (天前)：\$fullAge;
完全備份大小 (GiB)：\$fullSize;
完全備份速度 (MB/sec)：\$fullRate;
增量備份個數：\$incrCnt;
最後一次增量備份 (天前)：\$incrAge;
當前狀態：\$host_state;
殘: \$host_disabled;
最後一次備份結果：\$host_last_attempt;
EOF

#######################################################################
# Configuration editor strings
#######################################################################

$Lang{Only_privileged_users_can_edit_config_files} = "只有特權使用者可以編輯伺服器設定。";
$Lang{CfgEdit_Edit_Config}                         = "修改伺服器設定";
$Lang{CfgEdit_Edit_Hosts}                          = "增刪客戶端";

$Lang{CfgEdit_Title_Server}                        = "伺服器";
$Lang{CfgEdit_Title_General_Parameters}            = "一般參數";
$Lang{CfgEdit_Title_Wakeup_Schedule}               = "喚醒排程";
$Lang{CfgEdit_Title_Concurrent_Jobs}               = "並行任務";
$Lang{CfgEdit_Title_Pool_Filesystem_Limits}        = "備份池檔案系統資源限制";
$Lang{CfgEdit_Title_Other_Parameters}              = "其它參數";
$Lang{CfgEdit_Title_Remote_Apache_Settings}        = "遠程 Apache 伺服器設置";
$Lang{CfgEdit_Title_Program_Paths}                 = "程序路徑";
$Lang{CfgEdit_Title_Install_Paths}                 = "安裝路徑";
$Lang{CfgEdit_Title_Email}                         = "電子郵件";
$Lang{CfgEdit_Title_Email_settings}                = "電子郵件設置";
$Lang{CfgEdit_Title_Email_User_Messages}           = "使用者郵件內容設置";
$Lang{CfgEdit_Title_CGI}                           = "CGI";
$Lang{CfgEdit_Title_Admin_Privileges}              = "管理特權";
$Lang{CfgEdit_Title_Page_Rendering}                = "網頁外觀";
$Lang{CfgEdit_Title_Paths}                         = "路徑";
$Lang{CfgEdit_Title_User_URLs}                     = "使用者 URLs";
$Lang{CfgEdit_Title_User_Config_Editing}           = "使用者設定編輯";
$Lang{CfgEdit_Title_Xfer}                          = "傳輸";
$Lang{CfgEdit_Title_Xfer_Settings}                 = "傳輸設置";
$Lang{CfgEdit_Title_Ftp_Settings}                  = "FTP 設置";
$Lang{CfgEdit_Title_Smb_Settings}                  = "Smb 設置";
$Lang{CfgEdit_Title_Tar_Settings}                  = "Tar 設置";
$Lang{CfgEdit_Title_Rsync_Settings}                = "Rsync 設置";
$Lang{CfgEdit_Title_Rsyncd_Settings}               = "Rsyncd 設置";
$Lang{CfgEdit_Title_Archive_Settings}              = "備份設置";
$Lang{CfgEdit_Title_Include_Exclude}               = "包含／排除";
$Lang{CfgEdit_Title_Smb_Paths_Commands}            = "Smb 路徑／命令";
$Lang{CfgEdit_Title_Tar_Paths_Commands}            = "Tar 路徑／命令";
$Lang{CfgEdit_Title_Rsync_Paths_Commands_Args}     = "Rsync 路徑／命令／參數";
$Lang{CfgEdit_Title_Rsyncd_Port_Args}              = "Rsyncd 連接埠／參數";
$Lang{CfgEdit_Title_Archive_Paths_Commands}        = "備份路徑／命令";
$Lang{CfgEdit_Title_Schedule}                      = "排程";
$Lang{CfgEdit_Title_Full_Backups}                  = "完全備份";
$Lang{CfgEdit_Title_Incremental_Backups}           = "增量備份";
$Lang{CfgEdit_Title_Blackouts}                     = "備份暫停期";
$Lang{CfgEdit_Title_Other}                         = "其它";
$Lang{CfgEdit_Title_Backup_Settings}               = "備份設置";
$Lang{CfgEdit_Title_Client_Lookup}                 = "客戶端檢查";
$Lang{CfgEdit_Title_User_Commands}                 = "使用者命令";
$Lang{CfgEdit_Title_Hosts}                         = "客戶端";

$Lang{CfgEdit_Hosts_Comment} = <<EOF;
要增加一台新的備份客戶端，請點擊"新增"，然後在 "host" 列輸入其主機名。
關於 "dhcp" 列的選擇：只要該客戶端的 IP 地址能被 nslookup 或 nmblookup 命令
獲得，就不選擇此標誌位。"user" 列中填入該客戶端的一個擁有者或使用者的使用者名，
此使用者擁有開始／中止／瀏覽／恢復該客戶端備份的權限;同時此使用者將被傳送電子郵件，
所以此使用者名必須是一個合法電子郵件使用者名。"moreUsers" 列中可填入該客戶端的
其他使用者的使用者名，他們也擁有開始／中止／瀏覽／恢復該客戶端備份的權限，
多個使用者名間用逗號分隔且不能含空格。與 "user" 列不同的是，"moreUsers" 列
中使用者不被傳送電子郵件，所以他們不必是合法電子郵件使用者名，只要能被 
Apache Web 伺服器認證登錄即可。 如果想在一台現有客戶端的管理設定的基礎上
設定一台新機，該新機主機名可在 "host" 列以這種方式輸入 "NEWHOST=COPYHOST" ，
這裏 NEWHOST 是新機主機名，COPYHOST 是現有客戶端主機名。也可以以這種方式
修改一個現有客戶端的設定。要刪除一台現有備份客戶端，請點擊其所在行的"刪除"。
所有上述修改只有在點擊"儲存“後才能生效。被刪除的備份客戶端，其備份數據
並沒有被刪除。所以如果不慎"刪除"一台備份客戶端，只需重新"新增"即可。要想
完全刪除一台備份客戶端的備份數據，你需要手動刪除備份伺服器目錄
 \$topDir/pc/HOST 下的所有檔案，這裏 HOST 是該客戶端主機名。
EOF

$Lang{CfgEdit_Header_Main} = <<EOF;
\${h1("一般設定編輯")}
EOF

$Lang{CfgEdit_Header_Host} = <<EOF;
\${h1("客戶端 \$host 設定編輯")}
<p>
注意：適用於所有客戶端的全域預設設定，其相應 “取代” 旁的方框是不被選擇的。如果要修改本客戶端的某項設置，請點擊 “取代” 旁的方框。如果該設置已經處於被修改狀態，則修改後不需點擊 “取代” 旁的方框。如果要將其還原使用預設設定，則需點擊 “取代” 旁的方框，使其處於未被修改狀態。
<p>
EOF

$Lang{CfgEdit_Button_Save}     = "儲存";
$Lang{CfgEdit_Button_Insert}   = "插入";
$Lang{CfgEdit_Button_Delete}   = "刪除";
$Lang{CfgEdit_Button_Add}      = "新增";
$Lang{CfgEdit_Button_Override} = "取代";
$Lang{CfgEdit_Button_New_Key}  = "共享名稱(Windows Share)";
$Lang{CfgEdit_Button_New_Share} = "新增更享名稱或 '*'";

$Lang{CfgEdit_Error_No_Save}                            = "錯誤：有誤，無法儲存";
$Lang{CfgEdit_Error__must_be_an_integer}                = "錯誤：\$var 必須是整數";
$Lang{CfgEdit_Error__must_be_real_valued_number}        = "錯誤：\$var 必須是實數，不能是浮點數";
$Lang{CfgEdit_Error__entry__must_be_an_integer}         = "錯誤：\$var 內容 \$k 必須是整數";
$Lang{CfgEdit_Error__entry__must_be_real_valued_number} = "錯誤：\$var 內容 \$k 必須是實數，不能是浮點數";
$Lang{CfgEdit_Error__must_be_executable_program}        = "錯誤：\$var 必須是可執行程序";
$Lang{CfgEdit_Error__must_be_valid_option}              = "錯誤：\$var 必須是合法選項";
$Lang{CfgEdit_Error_Copy_host_does_not_exist}           = "客戶端 \$copyHost 不存在；生成全計算機名 \$fullHost。如果此客戶端不是你想要的，請將它刪除。";

$Lang{CfgEdit_Log_Copy_host_config}            = "使用者 \$User 拷貝了客戶端 \$fromHost 的設定到客戶端 \$host\n";
$Lang{CfgEdit_Log_Delete_param}                = "使用者 \$User 從設定 \$conf 中刪除了 \$p\n";
$Lang{CfgEdit_Log_Add_param_value}             = "使用者 \$User 新增了 \$p 到設定 \$conf 中，值設爲 \$value\n";
$Lang{CfgEdit_Log_Change_param_value}          = "使用者 \$User 將設定 \$conf 中的 \$p 從 \$valueOld 更改爲 \$valueNew\n";
$Lang{CfgEdit_Log_Host_Delete}                 = "使用者 \$User 刪除了客戶端 \$host\n";
$Lang{CfgEdit_Log_Host_Change}                 = "使用者 \$User 將客戶端 \$host 上的 \$key 從 \$valueOld 更改爲 \$valueNew\n";
$Lang{CfgEdit_Log_Host_Add}                    = "使用者 \$User 新增了客戶端 \$host: \$value\n";
  
#end of lang_zh_TW.pm
