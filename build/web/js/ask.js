const addButtonTrigger = el => {
  el.addEventListener('click', () => {
    const popupEl = document.querySelector(`.${el.dataset.for}`);
    popupEl.classList.toggle('popup--visible');
  });
};

Array.from(document.querySelectorAll('button[data-for]')).
forEach(addButtonTrigger);
