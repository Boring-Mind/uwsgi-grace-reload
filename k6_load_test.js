import http from 'k6/http';
import { check } from 'k6';


export const options = {
  vus: 100,
  duration: '30s',
};

export default function () {
  const res = http.get('http://0.0.0.0:8000/ping/');
  check(res, { 'status was 200': (r) => r.status == 200 });
}