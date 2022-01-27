//функция ждет повления элемента на странице
export function iWaitElement(el, timeout = 1) { //принимет 2 аргумента: элемент и таймаут, сколько ждать элемент
  el.waitForExist({
    timeout: timeout * 1000,
    timeoutMsg: `Элемент ${el.selector} не отображается на странице`,
  });
}

//устанавливает дейфолный таймаут тестов
export function setJasmineInterval() {
  jasmine.DEFAULT_TIMEOUT_INTERVAL = 400000;
}
