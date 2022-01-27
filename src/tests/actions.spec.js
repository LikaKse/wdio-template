import { loginPage } from '~/pages/loginPage';
import { setJasmineInterval } from '~/utils';

describe('test', () => {
  setJasmineInterval();

  it('ok', () => {
    browser.url("/");

    loginPage.login();
  });
  it('fail', () => {
    browser.url("/");

    loginPage.login();
    loginPage.getError();
  });
});
