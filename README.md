# IsItSMP modpack (auto-updating)

Minecraft **1.21.1**, **NeoForge 21.1.262**. This repo is the pack list that keeps everyone's
IsItSMP instance in sync: before the game starts, your launcher runs a small updater that
downloads whatever changed since your last launch (mods, configs, the questbook).

Mods are downloaded from Modrinth and CurseForge; this repo only holds links to them, plus the
pack's configs and our own mods (IsItCore, Debuginator).

## One-time setup (Windows)

1. **Make an instance**: Minecraft 1.21.1 with NeoForge 21.1.262, named IsItSMP.
   Already have an IsItSMP instance? Use that one; the updater keeps your files that already match.
2. **Download the updater**: [packwiz-installer-bootstrap.jar](updater/packwiz-installer-bootstrap.jar)
   and [update-pack.cmd](updater/update-pack.cmd) (open each, then "Download raw file").
   Put both in the instance folder, next to `mods` and `config`
   (in the launcher: right-click the instance, Open Folder).
3. **Add the pre-launch hook** to the instance:

   | Launcher | Where | Pre-launch command |
   | --- | --- | --- |
   | **GDLauncher** | Instance settings, Custom commands, Pre-launch hook | `cmd /c update-pack.cmd` |
   | **Modrinth App** | Instance settings, Launch hooks, Pre-launch | `cmd /c update-pack.cmd "$INST_JAVA"` |

4. Press **Play**. The first launch downloads the whole pack (a couple of minutes on a new
   instance), later launches only fetch changes and take a few seconds.

Your own settings (video, minimap, HUD, keybind-style configs) are installed once and never
overwritten. Gameplay configs and the questbook always follow the pack.

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
