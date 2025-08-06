# 🛠️ Flutter Evaluation App

A simple Flutter app built with clean architecture, state management, and local storage — designed for evaluation purposes.

## 🚀 Features

- 🔐 **Login Screen**  
  - Basic email/password validation  
  - Stores user email locally using `SharedPreferences`

- 📄 **Posts Screen**  
  - Fetches posts from a public API: [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts)  
  - Uses `Cubit` for clean and reactive state management  
  - Displays posts in a list with title and body preview

- 📋 **Post Details Screen**  
  - Displays full post details (title + body)  
  - Navigation handled using `Navigator.pushNamed`

---

## 📐 Architecture

This project follows a layered **Clean Architecture**:
# 🛠️ Flutter Clean Architecture App

This Flutter application is built using **Clean Architecture principles** with modular separation of concerns, state management using **Bloc**, and **local storage** using Shared Preferences. It includes features like user authentication and posts fetching (with offline support).

---

## 🚀 Features

- 🔐 Login with local validation
- 📰 Fetch posts from API
- 📦 Save posts locally on failure (offline cache)
- 🧠 Bloc State Management
- 📁 Clean Architecture (data, domain, presentation layers)

---

## 📁 Folder Structure

```plaintext
lib/
│
├── core/
│   └── helpers/
│       └── shared_pref_helper.dart
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── posts/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│
└── main.dart
```
---
Login Screen            | Posts Screen          | post Details Screen | 
:-------------------------:|:-------------------------:|:-------------------------:
![login](https://github.com/user-attachments/assets/107bb992-bc6e-4ec7-8836-cc5b31d4b67a) | ![posts](https://github.com/user-attachments/assets/5cd618f2-6065-4b87-b961-b8ad11334383) | ![posts_details](https://github.com/user-attachments/assets/540c3018-9f4e-48cf-877a-2e320e1d87b5) 


