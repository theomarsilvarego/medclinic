-- Allow prescriptions to be issued when neither VIDaaS nor a local certificate is available.
ALTER TABLE `clinical_documents`
  MODIFY `signature_provider` ENUM('LOCAL_P12', 'VIDAAS', 'UNSIGNED') NOT NULL DEFAULT 'LOCAL_P12';
