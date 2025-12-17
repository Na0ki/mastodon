import { createAction } from '@reduxjs/toolkit';

import type { ApiNotificationJSON } from 'mastodon/api_types/notifications';

export const notificationsUpdate = createAction(
  'notifications/update',
  ({
    playSound,
    sound,
    ...args
  }: {
    notification: ApiNotificationJSON;
    usePendingItems: boolean;
    playSound: boolean;
    sound: string;
  }) => ({
    payload: args,
    meta: { sound: playSound ? sound : undefined },
  }),
);
