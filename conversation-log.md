# Conversation Log

---

**Prompt 1:**
> alright for all my prompts, create a markdown file at the beginning of this project folder and keep my prompts as well as your responses to them in it.

**Response 1:**
Created this file (`conversation-log.md`) to log all prompts and responses going forward.

---

**Prompt 2:**
> now log this session into the markdown file too as far as i give you prompts; alright? now scan my whole project

**Response 2:**
Scanned the entire project and provided a full overview of the AI Interview Coach codebase — React 19 frontend, FastAPI backend, SQLite database, Whisper/Llama/MediaPipe integrations.

---

**Prompt 3:**
> Alright i noticed some bugs which i would like to fix;
> 1) Whenever i click log in/signin from the front dashboard it shows a blank page until I refresh it.
> 2) The user should have an option to edit their avatar in the right way once they click their profile, and it should remain there and saved to database.
> 3) The user's settings about their previous recorded sessions (such as his interest of the interview focus or which company he selected before for the interview.)
> 4) I also noticed that the ai agent's avatar photo needs to be updated each time by the user which is very bad, I would like to keep one a male and female as the user should only have the option to select between male (icon) and female (icon) and the image should already be there once provided by me (the admin. [tell me where you want me to put in the project file so you can put it in the project.])

**Response 3:**
Provided a detailed plan with root cause analysis. After user approval, implemented all 4 fixes:

### Fix 1 — Login blank page (`Login.jsx`)
- Replaced render-time `navigate()` with proper `<Navigate>` component + `useEffect` pattern
- Removed conflicting `setTimeout` navigations that caused race conditions
- Removed dead session-creation code that fired on every login

### Fix 2 — Avatar persistence (`Profile.jsx`)
- Added `await refreshProfile()` after `uploadAvatar()` to sync the auth context immediately
- This ensures the Navbar and other components show the new avatar without a page refresh

### Fix 3 — Session preferences (`Practice.jsx`, `GuidedSetup.jsx`)
- Added localStorage persistence for: practice role, practice topic, guided interview aim, target company, and duration
- Uses safe lazy initializers with `try/catch` for private browsing mode
- Profile-owned fields (difficulty, focus areas) remain profile-sourced to avoid conflicts

### Fix 4 — Fixed male/female AI avatar (`GuidedSetup.jsx` + images)
- Replaced photo upload with a simple male/female toggle (two styled buttons)
- Defaults to male avatar when switching to live mode
- Created directory: `frontend/public/avatars/`
- **ADMIN ACTION REQUIRED:** Place these two image files:
  - `Ai Interview Coach/frontend/public/avatars/male.jpg`
  - `Ai Interview Coach/frontend/public/avatars/female.jpg`
  - (Front-facing, well-lit headshot photos recommended for MediaPipe lip-sync to work)

---

**Prompt 4:**
> [Backend error - ModuleNotFoundError: No module named 'dotenv']

**Response 4:**
Identified missing `python-dotenv` dependency in `requirements.txt`. Advised installing via `pip install python-dotenv`.

---

**Prompt 5:**
> [Backend starts but login/register fails] ... now get Ahmad and Ameer Hamza some easy passwords

**Response 5:**
Set database passwords for existing users whose `password_hash` was NULL:
- **Ahmad** (`mahmadmuzi@gmail.com`) → `ahmad123`
- **Ameer Hamza** (`hamza@gmail.com`) → `hamza123`

---
