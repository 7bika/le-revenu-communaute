export interface FormState {
  ok?: boolean;
  message?: string;
  fieldErrors?: Record<string, string>;
  /** Valeurs saisies, renvoyées pour pré-remplir le formulaire après une erreur. */
  values?: Record<string, string>;
}

export const initialFormState: FormState = {};
