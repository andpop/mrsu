Хекслет, объектно-ориентированный дизайн (JS).

Валидация - процесс проверки корректности данных. В вебе происходит всегда при отправке форм, например, регистрация на многих сайтах проверяет корректность введённого емейла, его уникальность (что такого пользователя ещё нет).

Каждый тип валидации в таких системах обычно представлен классом-валидатором, который принимает на вход опции и предоставляет интерфейс в виде функции `validate()`. Эта функция принимает на вход то, что проверяется (валидируется) и возвращает массив или объект с ошибками. Если объект пустой, значит ошибок нет.

solution.js
Реализуйте и экспортируйте по умолчанию класс `PasswordValidator`, ориентируясь на тесты.

Этот валидатор поддерживает следующие опции:

`minLength` (по умолчанию 8) - минимальная длина пароля
`containNumbers` (по умолчанию true) - требование содержать хотя бы одну цифру
Опции передаются одним объектом в конструктор валидатора.

Объект ошибок в ключах содержит название опции, а в значениях текст, указывающий на ошибку (тексты можно подсмотреть в тестах).

``
import PasswordValidator from '../solution.js';

test('testValidateWithDefaultOptions', () => {
  const validator = new PasswordValidator({ containNumbers: false });
  const errors1 = validator.validate('qwertyui');
  expect(errors1).toEqual({});

  const errors2 = validator.validate('qwerty');
  expect(errors2).toEqual({ minLength: 'too small' });

  const errors3 = validator.validate('another-password');
  expect(errors3).toEqual({});
});

test('testValidateWithOptions 1', () => {
  const validator = new PasswordValidator();
  const errors1 = validator.validate('qwertya3sdf');
  expect(errors1).toEqual({});

  const errors2 = validator.validate('qwerty');
  expect(errors2).toEqual({
    minLength: 'too small',
    containNumbers: 'should contain at least one number',
  });

  const errors3 = validator.validate('q23ty');
  expect(errors3).toEqual({ minLength: 'too small' });
});

test('testValidateWithOptions 2', () => {
  const validator = new PasswordValidator({ containNumbers: true, minLength: 10 });
  const errors1 = validator.validate('qwert3yag');
  expect(errors1).toEqual({
    minLength: 'too small',
  });

  const errors2 = validator.validate('qwerty');
  expect(errors2).toEqual({
    minLength: 'too small',
    containNumbers: 'should contain at least one number',
  });

  const errors3 = validator.validate('q2wer3ty4i');
  expect(errors3).toEqual({});
});

test('testValidateWithOptions 3', () => {
  const validator = new PasswordValidator({ minLength: 0, containNumbers: null });
  const errors1 = validator.validate('');
  expect(errors1).toEqual({});
});

test('testValidateWithIncorrectOptions', () => {
  const validator = new PasswordValidator({ containNumberz: null });
  const errors1 = validator.validate('qwert5yui');
  expect(errors1).toEqual({});

  const errors2 = validator.validate('0werty');
  expect(errors2).toEqual({ minLength: 'too small' });
});
``

