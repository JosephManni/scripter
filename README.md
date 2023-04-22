<p align="center">
 <img src="https://www.josephmanni.com/assets/img/script-editor.png" alt="Alt text" title="Applescript">
</p>
<h1 align="center">Applescript</h1>

AppleScript is a powerful and versatile scripting language for automating tasks on Apple devices. Unlike Shortcuts, which is a visual automation tool, AppleScript allows you to write code that can perform complex tasks and interact with other applications. These scripts are also easy to integrate with bash scripts (see [timedSend.sh](https://github.com/JosephManni/applescript/timedSend.sh) ). ~Drag and drop automation~, seriously? Let's tackle automation with some *actual code*!

 Try it out!


### Table of Contents

- [Scripting iMessage](#-scripting-iMessage)
- [Scripting Music](#-scripting-Music)
- [Scripting Reminders](#-scripting-Reminders)
- [Scripting Safari](#-scripting-Safari)
- [Scripting with Cron Jobs](#-scripting-with-Cron-Jobs)

<br/>

### → Scripting iMessage

**Send Message**

```sh
$ osascript scripts/iMessage/sendMessage.scpt 123-456-7890 "Sent from applescript!"
```

**Spam Message**

```sh
$ osascript scripts/iMessage/spamMessage.scpt 123-456-7890 "Use tabs instead of spaces!!!" 100
```


<br/>

### → Scripting Music

**Play Song**

```sh
$ osascript scripts/Music/playSong.scpt "Hello"
```

**Play Random Song Starting With Letter**

```sh
$ osascript scripts/Music/playRand.scpt 'A'
```


<br/>

### → Scripting Reminders

**List all reminders**

```sh
$ osascript scripts/Reminders/getReminders.scpt "all"
```

**List range of reminders**

```sh
$ osascript scripts/Reminders/getReminders.scpt 1-3
```

**Add Reminder**

```sh
$ osascript scripts/Reminders/addReminder.scpt "exit vim ASAP"
```

**Delete Reminder by Name**

```sh
$ osascript scripts/Reminders/deleteReminder.scpt "exit vim ASAP"
```


<br/>

### → Scripting Safari

**Open group of tabs**

```sh
$ osascript scripts/Safari/openTabs.scpt "Work"
```

**Auto click on button**

```sh
$ osascript scripts/Safari/autoClick.scpt 26 17 100
```


<br/>

### → Scripting with Cron Jobs

**Send message at given time interval using sendMessage**

```sh
$ sh scripts/cron-jobs/timedSend.sh
```
