

## 📱 Timely — iOS Appointment App

Timely is a SwiftUI-based iOS app designed for managing appointments. It features secure login, an elegant appointment overview, chat, journaling, and profile management.

### Gallery

![Login](https://github.com/user-attachments/assets/12fed26e-0369-4acd-82fd-0e973798059e)

![Past Appointments](https://github.com/user-attachments/assets/52269d8f-2303-4762-8000-128de44b5a97)

![Upcoming Appointments](https://github.com/user-attachments/assets/134db741-f0d4-44cc-a925-288afc49592d)

![Profile](https://github.com/user-attachments/assets/36497c4c-a14f-4d59-b12e-9f42302c9e67)

![Journel](https://github.com/user-attachments/assets/0e540afa-a9ae-4214-a584-615ddb763acd)

![Chat](https://github.com/user-attachments/assets/dd6cf40a-8732-42b6-aaee-8f4bd5ed5429)

![Demo](https://www.youtube.com/watch?v=F6JgU5Okgz0)
---

### 🚀 Features

* ✅ **Secure Login**

  * Single-user authentication using JWT
  * Persistent login support

* 📅 **Appointments Overview**

  * List of upcoming & past appointments
  * Appointment cards with type, time, recurrence
  * Custom styling from Figma design

* 💬 **Chat View**

  * Basic chat (local state for now)
  * Supports message input and scrolling thread

* 📓 **Journal View**

  * Write daily thoughts or notes
  * View saved entries in a list
  * Delete entries via swipe

* 👤 **Profile Page**

  * Displays user info
  * Supports logout
  * Placeholder for settings/edit

---

### 📂 Folder Structure

```bash
Fay/
├── Views/
│   ├── AppointmentsView.swift
│   ├── ChatView.swift
│   ├── JournalView.swift
|   ├── LoginView.swift
│   ├── ProfileView.swift
│   └── HomeView.swift
├── Models/
│   ├── Appointment.swift
├── ViewModels/
│   ├── AuthViewModel.swift
│   ├── JournalViewModel.swift
│   └── ChatViewModel.swift
|   ├── AppointMEntsViewModel.swift
├── Service/
│   ├── APIService.swift
├── Resources/
│   └── Assets.xcassets/
└── TimelyApp.swift
```

---

### 🧪 Getting Started

1. Clone this repo:

   ```bash
   git clone git@github.com:mihirdaka/timely.git
   ```

2. Open in Xcode:

   ```bash
   open Timely.xcodeproj
   ```

3. Build & Run:

   * Make sure your iOS simulator or device is selected
   * Use this credentials:

     ```
     Username: john
     Password: 12345
     ```

---

### 🧑‍💻 Author

Mihir Daka
[LinkedIn](https://www.linkedin.com/in/dakamihir/) • [GitHub](https://github.com/mihirdaka)

---
