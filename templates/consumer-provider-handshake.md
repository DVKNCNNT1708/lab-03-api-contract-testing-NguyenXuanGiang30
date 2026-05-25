# Consumer–Provider Handshake

## Thông tin chung

- Lab: FIT4110 Lab 03
- Ngày: 25/05/2026
- Provider team: team-gate (Access Gate)
- Consumer team: team-core (Core Business)
- Provider service: Access Gate System Service
- Consumer service: Core Business Portal Service

## Contract

- Contract file: `contracts/gate.openapi.yaml` (OpenAPI 3.0.3, 0 Errors, 0 Warnings)
- Mock base URL: `http://localhost:4012`
- Auth method: Bearer JWT Authorization
- Endpoint được test:
  1. `GET /health` (Public health check status)
  2. `GET /access/logs/recent` (Recent swipe records, pagination limit filter)
  3. `GET /access/logs/{logId}` (Access event record details by UUID)
  4. `GET /gates/{gateId}/status` (Gate states checking)
  5. `GET /cards/{cardId}` (Card profiles query)

## Smoke test

### Request

```http
GET /cards/RFID-2026-001
Authorization: Bearer lab-token
Accept: application/json
```

### Expected response (200 OK)

```json
{
  "cardId": "RFID-2026-001",
  "status": "ACTIVE",
  "assignedTo": "0196fb3d-4ad7-7d1e-9f49-5d5148d2babc",
  "expiredAt": "2027-01-01T00:00:00Z"
}
```

### Negative Scenario Response (404 Not Found)

```json
{
  "type": "https://campus.local/errors/not-found",
  "title": "Not Found",
  "status": 404,
  "detail": "Không tìm thấy ID tương ứng"
}
```

## Kết quả

- [x] Consumer gọi mock thành công (Tích hợp thành công tại folder `05_Consumer_side_Smoke` qua Newman).
- [x] Consumer parse được field cần dùng (Trích xuất các thuộc tính `cardId` và `status` thành công).
- [x] Consumer hiểu lỗi 4xx/5xx provider trả về (Kiểm soát chuẩn hóa cấu trúc lỗi Problem RFC 7807).
- [x] Có Newman report hoặc screenshot (Báo cáo tại `reports/newman-report.html` và `reports/newman-report-mock.xml`).

## Ghi chú thay đổi hợp đồng

| Nội dung | Trước | Sau | Người đồng ý |
|---|---|---|---|
| Chuyển đổi định dạng nullable | `type: [string, "null"]` | `type: string` và `nullable: true` | Nguyễn Xuân Giang |
| Thêm endpoint sức khỏe | Không có `/health` | Thêm `/health` trả về status và service | Nguyễn Xuân Giang |
| Tách biệt schema nhóm | Có `SensorEvent` và `SensorReading` | Loại bỏ các schema không liên quan của team-iot để tránh linter sập | Nguyễn Xuân Giang |

## Xác nhận

- Provider representative: Nguyễn Xuân Giang (team-gate Lead)
- Consumer representative: Nguyễn Xuân Giang (team-core Representative)
