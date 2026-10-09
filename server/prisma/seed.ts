import { PrismaClient, Profile } from '@prisma/client';
import bcrypt from 'bcryptjs';

const prisma = new PrismaClient();

async function main() {
  const passwordHash = await bcrypt.hash('123456', 10);
  await prisma.user.upsert({
    where: { login: 'theomar_rego@hotmail' },
    update: { fullName: 'Administrador MedClinic', passwordHash, profile: Profile.ADMINISTRADOR },
    create: { fullName: 'Administrador MedClinic', login: 'theomar_rego@hotmail.com', passwordHash, profile: Profile.ADMINISTRADOR }
  });
  await prisma.user.upsert({
    where: { login: 'christiane.calixto@hotmail.com' },
    update: { fullName: 'Christiane Calixto', profile: Profile.MEDICO },
    create: { fullName: 'Christiane Calixto', login: 'christiane.calixto@hotmail.com', passwordHash, profile: Profile.MEDICO }
  });
  console.log('Usuária Christiane Calixto criada/atualizada como Médica.');
}

main().finally(() => prisma.$disconnect());
