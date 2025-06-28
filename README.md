

## 📱 Timely — iOS Appointment App

Timely is a SwiftUI-based iOS app designed for managing appointments. It features secure login, an elegant appointment overview, chat, journaling, and profile management.


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
