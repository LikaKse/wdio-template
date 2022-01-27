import { credentials } from '~/credentials';
import { iWaitElement } from '~/utils';
//import { config } from '~/wdio.conf';

// объявлени класса страницы
class LoginPage {
  //описание селекторов на странице
  get loginUser() { //так записываем селекторы
    return $('#inputLogin');
  }

  get loginPasswd() {
    return $('input[type="password"]');
  }

  get loginBtn() {
    return $('#login-form button');
  }

  get userPic() {
    return $('#self-avatar');
  }
  get notExist() {
    return $('#not-exist');
  }

  getError(){
    iWaitElement(this.notExist, 1);
  }

  login() { //описание функции логина
    browser.url('/');
    iWaitElement(this.loginUser, 5);
    this.loginUser.addValue(credentials.user);
    this.loginPasswd.addValue(credentials.pass);
    this.loginBtn.click();
    iWaitElement(this.userPic, 5);
  }
}

export const loginPage = new LoginPage(); //экспорт объекта loginPage из этого файла
