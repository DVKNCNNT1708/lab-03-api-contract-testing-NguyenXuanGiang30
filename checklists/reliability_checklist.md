# Reliability Checklist — FIT4110 Lab 03

Điền checklist này trước khi nộp Lab 03.

## 1. Functional tests

- [x] Có test cho endpoint health.
- [x] Có test happy path cho endpoint chính.
- [x] Có kiểm tra status code 2xx.
- [x] Có kiểm tra field quan trọng trong response (eventId, decision, status, gateId, cardId, v.v.).
- [x] Có ít nhất 1 test đọc dữ liệu danh sách hoặc chi tiết (`GET /access/logs/recent` và `GET /access/logs/{logId}`).

## 2. Auth tests

- [x] Có test thiếu token.
- [x] Có test sai token hoặc token rỗng.
- [x] Endpoint public được khai báo rõ nếu không cần auth (Endpoint `/health` là public).
- [x] Test thể hiện đúng expected status 401/403 (Có skip-on-mock logic được kiểm soát chặt chẽ).

## 3. Negative tests

- [x] Có test thiếu field bắt buộc.
- [x] Có test sai kiểu dữ liệu (wrong UUID format).
- [x] Có test sai enum hoặc giá trị ngoài miền (gateId/cardId/limit ngoài pattern regex và range).
- [x] Lỗi trả về theo cùng một error model (ProblemDetails RFC 7807).

## 4. Boundary tests

- [x] Có test min/max hoặc dữ liệu sát ngưỡng (limit = 100).
- [x] Có test limit/pagination nếu endpoint có danh sách (lọc limit = 100, 101, 0).
- [x] Có test payload lớn hoặc metadata thiếu (kiểm tra các query parameters).
- [x] Có ghi chú kỳ vọng xử lý dữ liệu biên (trong Collection description và mock data).

## 5. Reliability tests cơ bản

- [x] Có kiểm tra response time (Local SLA < 100ms).
- [x] Có mô tả timeout mong muốn (SLA response time được cấu hình trong Local folder).
- [x] Có test hoặc ghi chú retry/idempotency nếu phù hợp (GET endpoints an toàn và idempotent).
- [x] Có consumer-side smoke test với ít nhất 1 mock của nhóm khác (Giả lập Consumer Core Business tích hợp gọi thử Access Gate).

## 6. Evidence

- [x] Collection export JSON (Lưu tại `postman/collections/gate.postman_collection.json`).
- [x] Environment mock export JSON (Lưu tại `postman/environments/gate_mock.postman_environment.json`).
- [x] Environment local export JSON (Lưu tại `postman/environments/gate_local.postman_environment.json`).
- [x] Newman report XML/HTML (Báo cáo sinh ra tại `reports/newman-report-mock.xml` và `reports/newman-report.html`).
- [x] Test-case matrix đã điền (Lưu tại `templates/test-case-matrix.csv`).
- [x] Biên bản handshake đã điền (Lưu tại `templates/consumer-provider-handshake.md`).
