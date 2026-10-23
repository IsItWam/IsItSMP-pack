# IsItSMP modpack (auto-updating)

Minecraft **1.21.1**, **NeoForge 21.1.262**. This repo is the pack list that keeps everyone's
IsItSMP instance in sync: before the game starts, your launcher runs a small updater that
downloads whatever changed since your last launch (mods, configs, the questbook).

Mods are downloaded from Modrinth and CurseForge; this repo only holds links to them, plus the
pack's configs and our own mods (IsItCore, Debuginator).

## Install (Windows)

1. **Download [IsItSMP.mrpack](https://github.com/IsItWam/IsItSMP-pack/releases/download/starter/IsItSMP.mrpack)**
   and import it with your launcher's import option (GDLauncher and the Modrinth App both take `.mrpack` files).
   It sets up Minecraft 1.21.1 with NeoForge and already contains the updater.
2. **Turn on auto-updates** in the new instance's settings by pasting one pre-launch command
   (also written in `TURN-ON-AUTO-UPDATES.txt` in the instance folder):

   | Launcher | Where | Pre-launch command |
   | --- | --- | --- |
   | **GDLauncher** | Instance settings, Custom commands, Pre-launch hook | `cmd /c update-pack.cmd` |
   | **Modrinth App** | Instance settings, Launch hooks, Pre-launch | `cmd /c update-pack.cmd "$INST_JAVA"` |

3. Optional: set the instance icon to [icon.png](icon.png) (launchers can't take it from the pack).
4. Press **Play**. The first launch downloads a few mods that can't be included in the file;
   after that each launch only fetches what changed, in a few seconds.

**Already have an IsItSMP instance?** Instead of step 1, put
[packwiz-installer-bootstrap.jar](updater/packwiz-installer-bootstrap.jar) and
[update-pack.cmd](updater/update-pack.cmd) in its folder (next to `mods` and `config`), then do steps 2-4.

**Your config changes are kept.** The `.mrpack` comes with a `keep-my-changes.txt` file next to
`update-pack.cmd`: you still get new and updated mods, new config files and the questbook, but a
config you already have is never overwritten. Delete that file if you'd rather match the pack
exactly. (Already-set-up instances: create an empty `keep-my-changes.txt` to switch it on.
Removing a pack mod yourself doesn't stick, the updater puts it back; extra mods you add are left alone.)

**When NeoForge changes:** the updater can't change the launcher's NeoForge version. If the pack
moves to a new NeoForge, it will be announced; switch the instance's NeoForge version yourself.

## For the server

Run before starting the server (server-side mods only, no window):

```
java -jar packwiz-installer-bootstrap.jar -g -s server https://raw.githubusercontent.com/IsItWam/IsItSMP-pack/main/pack.toml
```

## For maintainers

Don't edit this repo by hand. It is generated from Sam's GDLauncher instance by
`scripts/pack/sync_pack.py` in the private IsItSMP repo, then committed and pushed.
