# 🛒 E-Commerce App

## 📌 Project Overview
This is a Flutter-based eCommerce application built using **Test-Driven Development (TDD)** and follows **Clean Architecture** principles. The app includes the following core functionalities:
- Add products
- Update products
- Get product details
- Delete products

## 🏗️ Project Architecture
The project is structured into three main layers:

### 1️⃣ **Presentation Layer**
- **UI**: Handles user interactions.
- **BLoC (Business Logic Component)**: Manages state and communicates with the domain layer.

### 2️⃣ **Domain Layer**
- **Entities**: Defines core business models.
- **Use Cases**: Implements the business logic.
- **Repository Interface**: Acts as an abstraction between the domain and data layers.

### 3️⃣ **Data Layer**
- **Repository Implementation**: Implements the repository interface.
- **Remote Data Source**: Handles API requests.
- **Local Data Source**: Manages caching or local database storage.
- **Models**: Converts API responses to domain entities.

## 🔄 Data Flow
1. The **UI** interacts with **BLoC**.
2. **BLoC** calls the corresponding **Use Case** from the domain layer.
3. The **Use Case** communicates with the **Repository Interface**.
4. The **Repository Implementation** decides whether to fetch data from the **Remote Data Source** (API) or the **Local Data Source** (cache/database).
5. Data is passed back up to the UI through the **BLoC**.

## 🧪 Testing Strategy
This project follows **Test-Driven Development (TDD)** with:
- **Unit Tests** for Use Cases and Repository.
- **Widget Tests** for UI components.
- **Integration Tests** for complete workflows.

## 🚀 Setup & Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/ecommerce-app.git
   cd ecommerce-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run tests:
   ```sh
   flutter test
   ```
4. Run the app:
   ```sh
   flutter run
   ```

