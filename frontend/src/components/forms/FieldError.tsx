export function FieldError({ id, message }: { id: string; message?: string }) {
  if (!message) return null;
  return (
    <p id={id} className="err-msg" role="alert">
      {message}
    </p>
  );
}

export function FormAlert({ message, tone = 'error' }: { message?: string; tone?: 'error' | 'success' }) {
  if (!message) return null;
  return (
    <p
      role={tone === 'error' ? 'alert' : 'status'}
      className={`rounded-sm px-3 py-2.5 text-[13.5px] ${tone === 'error' ? 'bg-alert-soft text-ink' : 'bg-ok-soft text-ok'}`}
    >
      {message}
    </p>
  );
}
