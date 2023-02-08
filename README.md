<p align="center">
 <img src="https://josephmanni.com/assets/img/script-editor.png" alt="Alt text" title="Applescript">
</p>
<h1 align="center">Applescript</h1>

AppleScript is a powerful and versatile scripting language for automating tasks on Apple devices. Unlike Shortcuts, which is a visual automation tool, AppleScript allows you to write code that can perform complex tasks and interact with other applications. These scripts are also easy to integrate with bash scripts (see [timedSend.sh](https://github.com/JosephManni/applescript/timedSend.sh) ). ~Drag and drop automation~, seriously? You're a **developer**, so let's tackle automation with some *actual code*!

 Try it out!


### Table of Contents

- [Scripting iMessage](#-scripting-iMessage)
- [Scripting Reminders](#-scripting-Reminders)
- [Scripting Safari](#-scripting-Safari)
- [Scripting with Cron Jobs](#-scripting-with-Cron-Jobs)

<br/>

### → Scripting iMessage

**Send Message**

```sh
$ osascript scripts/iMessage/sendMessage.applescript 123-456-7890 "Sent from applescript!"
```

**Spam Messages**

```sh
$ osascript scripts/iMessage/spamMessages.applescript 123-456-7890 "Use tabs instead of spaces next time!" 100
```

<br/>

### → Scripting Reminders

**Get reminders in list**

```sh
$ osascript scripts/reminders/get-reminders-in-list.applescript "Today"
```


<br/>

### → Scripting Safari

**Open list of tabs**

```sh
$ osascript scripts/Safari/openTabs.applescript "Work"
```

**Auto click on button**

```sh
$ osascript scripts/Safari/autoClick.applescript 26 17
```


<br/>

### → Scripting with Cron Jobs

**Send message at given time interval using sendMessage**

```sh
$ sh scripts/cron-jobs/timedSend.sh
```