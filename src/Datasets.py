###############################################################################
""" 
CLASS TO STORE THE DATASET
"""

import numpy as np;
class DataSet(object):
    def __init__(self, texts, labels):
        assert texts.shape[0] == labels.shape[0], (
          'texts.shape: %s labels.shape: %s' % (texts.shape,labels.shape))
        self._num_examples = texts.shape[0]
        self._texts = texts
        self._labels = labels
        self._epochs_completed = 0
        self._index_in_epoch = 0

    @property
    def texts(self):
        return self._texts

    @property
    def labels(self):
        return self._labels

    @property
    def num_examples(self):
        return self._num_examples

    @property
    def epochs_completed(self):
        return self._epochs_completed

    def next_batch(self, batch_size, fake_data=False): 
        """Return the next `batch_size` examples from this data set."""
        start = self._index_in_epoch
        self._index_in_epoch += batch_size
        if self._index_in_epoch > self._num_examples:
          # Finished epoch
          self._epochs_completed += 1
          # Shuffle the data
          perm = np.arange(self._num_examples)
          np.random.shuffle(perm)
          self._texts = self._texts[perm]
          self._labels = self._labels[perm]
          # Start next epoch
          start = 0
          self._index_in_epoch = batch_size
          assert batch_size <= self._num_examples
        end = self._index_in_epoch
        return self._texts[start:end], self._labels[start:end]
 
###############################################################################
   
class DataSets(object):
        pass