# Midas Core - Advanced Software Engineering Project

Midas Core is a robust, event-driven banking backend system developed as part of the JPMC Advanced Software Engineering Forage program. It handles real-time financial transactions, balance management, and integration with external incentive services.

## 🚀 Features

- **Event-Driven Architecture**: Processes real-time transaction updates via **Apache Kafka**.
- **Financial Transaction Validation**: Ensures transaction integrity by verifying sender/recipient existence and sufficient funds.
- **Relational Data Persistence**: Utilizes **H2 Database** with **Spring Data JPA** for resilient storage of user records and transaction history.
- **Microservices Integration**: Synchronously communicates with an external **Incentives API** to award bonuses to transaction recipients.
- **RESTful API**: Exposes a secure endpoint for querying user balances in real-time.
- **Automated Testing Suite**: Includes comprehensive test cases for system verification (Tasks 1-5).

## 🛠️ Technology Stack

- **Language**: Java 17+
- **Framework**: Spring Boot 3.2.5
- **Messaging**: Apache Kafka
- **Database**: H2 (In-Memory)
- **Persistence**: Spring Data JPA / Hibernate
- **Build Tool**: Maven
- **Testing**: JUnit 5, Spring Boot Test, Testcontainers

## ⚙️ Configuration

The application is configured via `src/main/resources/application.yml` (or the root `application.yml` in this repo).
- **Server Port**: `33400`
- **Kafka Topic**: `trader-updates`
- **Incentives API URL**: `http://localhost:8080/incentive`

## 🏃 Getting Started

### Prerequisites
- Java 17 or higher
- Maven (included via `./mvnw`)
- Kafka (managed via Spring Boot Test or local instance)

### Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd forage-midas
   ```

2. Build the project:
   ```bash
   ./mvnw clean install
   ```

### Running the Application
To start the core application:
```bash
./mvnw spring-boot:run
```

### Running the Incentives API
The incentives service must be running for transaction processing to include bonuses:
```bash
java -jar services/transaction-incentive-api.jar
```

## 📡 API Endpoints

### Query User Balance
Exclusively responds to GET requests.
- **URL**: `http://localhost:33400/balance`
- **Method**: `GET`
- **Params**: `userId` (Long)
- **Response**:
  ```json
  {
    "amount": 1234.56
  }
  ```
  *Returns an amount of 0.0 if the user does not exist.*

## 🧪 Testing

The project includes five primary task verifiers:
```bash
./mvnw test -Dtest=TaskOneTests
./mvnw test -Dtest=TaskTwoTests
./mvnw test -Dtest=TaskThreeTests
./mvnw test -Dtest=TaskFourTests
./mvnw test -Dtest=TaskFiveTests
```

## 📝 License
This project is part of a training program and is intended for educational purposes.
